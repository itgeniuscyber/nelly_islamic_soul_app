import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_soul_app/constants/Constants.dart';
import 'package:muslim_soul_app/models/Qari.dart';
import 'package:muslim_soul_app/services/api_services.dart';

import '../models/surah.dart';
import 'audio_screen.dart';

class AudioSurahScreen extends StatefulWidget {
  const AudioSurahScreen({super.key, required this.qari});
  final Qari qari;

  @override
  State<AudioSurahScreen> createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Surah List',
            style: TextStyle(
              color: Constants.kPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: apiServices.getSurah(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {
              List<Surah>? surah = snapshot.data;
              return ListView.builder(
                  itemCount: surah!.length,
                  itemBuilder: (context, index) => AudioTile(
                      surahName: snapshot.data![index].englishName,
                      totalAya: snapshot.data![index].numberOfAyahs,
                      number: snapshot.data![index].number,
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AudioScreen(
                                qari: widget.qari,
                                index: index + 1,
                                list: surah,
                              ),
                            ));
                      }));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Widget AudioTile(
    {required String? surahName,
    required totalAya,
    required number,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 0,
              color: Colors.black12,
              offset: Offset(2, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 45,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  (number).toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surahName!,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  // totalAya.toString(),
                  "Total Aya : $totalAya",
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.play_circle_fill,
              color: Constants.kPrimary,
            ),
          ],
        ),
      ),
    ),
  );
}
