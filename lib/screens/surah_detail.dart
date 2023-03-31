import 'package:flutter/material.dart';
import 'package:muslim_soul_app/models/translation.dart';
import 'package:muslim_soul_app/services/api_services.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../Widgets/custom_translation.dart';
import '../constants/Constants.dart';

enum Translation { urdu, hindi, english, luganda }

class Surahdetail extends StatefulWidget {
  const Surahdetail({super.key});

  static const String id = 'surahDetail_screen';

  @override
  State<Surahdetail> createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {
  ApiServices _apiServices = ApiServices();
  // SolidController _controller = SolidController();
  Translation? _translation = Translation.urdu;

  @override
  Widget build(BuildContext context) {
    print(_translation!.index);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          // future: _apiServices.getTranslation(Constants.surahIndex!),
          future: _apiServices.getTranslation(
              Constants.surahIndex!, _translation!.index),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                        index: index,
                        surahTranslation:
                            snapshot.data!.translationList[index]);
                  },
                ),
              );
            } else {
              return const Center(child: Text('Translation not Found'));
            }
          },
        ),
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 9, 8, 6),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            // color: Theme.of(context).primaryColor,

            height: 50,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "swipe me up to Change Language Translation",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
          ),
          body: Container(
            // color: Colors.white,
            // color: Colors.black12,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 217, 178).withOpacity(0.8),
              image: const DecorationImage(
                image: AssetImage('assets/read_quran.jpg'),
                fit: BoxFit.cover,
                opacity: 0.8,
                // opacity: 0.5,
              ),
            ),

            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    // 1st list for Udur
                    ListTile(
                      title: Text(
                        'English',
                        style: TextStyle(
                            color: Color.fromARGB(255, 22, 18, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      leading: Radio<Translation>(
                        value: Translation.urdu,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    // 2nd list for hindi
                    ListTile(
                      title: Text(
                        'Hindi',
                        style: TextStyle(
                            color: Color.fromARGB(255, 22, 18, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      leading: Radio<Translation>(
                        value: Translation.hindi,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),

                    // 3rd list for English
                    ListTile(
                      title: Text(
                        'urdu',
                        style: TextStyle(
                          color: Color.fromARGB(255, 22, 18, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      leading: Radio<Translation>(
                        value: Translation.english,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    // 4th list for Luganda
                    ListTile(
                      title: Text(
                        'Luganda',
                        style: TextStyle(
                            color: Color.fromARGB(255, 22, 18, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      leading: Radio<Translation>(
                        value: Translation.luganda,
                        groupValue: _translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
