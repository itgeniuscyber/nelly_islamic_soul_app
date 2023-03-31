import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslim_soul_app/services/api_services.dart';
import 'package:quickalert/quickalert.dart';

import '../Widgets/qari_custom_tile.dart';
import '../constants/Constants.dart';
import '../models/Qari.dart';
import '../services/api_services.dart';
import 'audio_surah_screen.dart';

class QariListScreen extends StatefulWidget {
  const QariListScreen({super.key});

  @override
  State<QariListScreen> createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiServices apiServices = ApiServices();

  void NellyPop(QuickAlertType QuickAlertType, yourTitle, yourText) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType,
      title: yourTitle,
      text: yourText,
      confirmBtnColor: Constants.kPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              hoverColor: Color.fromARGB(255, 76, 235, 81),
              backgroundColor: Constants.kPrimary,
              onPressed: () {
                NellyPop(
                  QuickAlertType.loading,
                  "Awesome right! ",
                  "Select Any preffered Quran reciters, Recitations from Mecca, Children recitations, Quran mp3 translations for All Ayhas.. credits to Twaha ",
                );
              },
              child: const Icon(Icons.info_outline_rounded)),
          appBar: AppBar(
            title: Text('Quran Mp3'),
            centerTitle: true,
            backgroundColor: Constants.kPrimary,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // lottie amination
                Lottie.asset('lottie/qa1.json'),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text('Search'),
                        Spacer(),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder(
                    future: apiServices.getQariList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Qari>> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                              'Quran Audio not found, Please Connect To internet'),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return QariCustomTile(
                              qari: snapshot.data![index],
                              ontap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => AudioSurahScreen(
                                            qari: snapshot.data![index])));
                              },
                            );
                          });
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
