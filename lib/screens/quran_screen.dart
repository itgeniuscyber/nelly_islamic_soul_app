import 'package:flutter/material.dart';
import 'package:muslim_soul_app/services/api_services.dart';
import 'package:quickalert/quickalert.dart';

import '../Widgets/sajda_custom_tile.dart';
import '../Widgets/surah_custom_tile.dart';
import '../constants/Constants.dart';
import '../models/sajda.dart';
import '../models/surah.dart';
import 'juz_screen.dart';
import 'surah_detail.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();
  // bool showDialog = true;
  // bool NellyPopz = true;
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
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              hoverColor: Color.fromARGB(255, 76, 235, 81),
              backgroundColor: Constants.kPrimary,
              onPressed: () {
                NellyPop(
                  QuickAlertType.success,
                  "Welcome to Quran",
                  "Kindly Read with Passion, choose your desired Surah and Translate to your prefered Language... navigate through surahs with all Ayahs, sajdas and Juzs'...  Twaha has made it easier for Any moslem to use this App to know more about Islamic Religion, ",
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.thumb_up_outlined),
              ),
            ),
            appBar: AppBar(
              title: const Text('Quran'),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  // index 0
                  Text(
                    'Surah',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  //  index 1
                  Text(
                    'Sajda',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  // index 2
                  Text(
                    'juz',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                TabBarView(
                  children: <Widget>[
                    // quran builder Tab code
                    FutureBuilder(
                        future: apiServices.getSurah(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Surah>> snapshot) {
                          if (snapshot.hasData) {
                            List<Surah>? surah = snapshot.data;
                            return ListView.builder(
                              itemCount: surah!.length,
                              itemBuilder: (context, index) =>
                                  SurahCustomListTile(
                                surah: surah[index],
                                context: context,
                                ontap: () {
                                  setState(() {
                                    Constants.surahIndex = (index + 1);
                                  });
                                  Navigator.pushNamed(context, Surahdetail.id);
                                },
                              ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),

                    // sajda builder tab code
                    FutureBuilder(
                      future: apiServices.getSajda(),
                      builder: (BuildContext context,
                          AsyncSnapshot<SajdaList> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Some Thing Went Wrong'),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.sajdaAyahs.length,
                          itemBuilder: (context, index) => SajdaCustomTile(
                            snapshot.data!.sajdaAyahs[index],
                            context,
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  Constants.juzIndex = (index + 1);
                                });
                                Navigator.popAndPushNamed(
                                    context, JuzScreen.id);
                              },
                              child: Card(
                                elevation: 4,
                                color: Colors.blueGrey,
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                //Nelly QuickAlert test Code

                // showDialog
                //     ? Container(
                //         //this is the blur container
                //         width: MediaQuery.of(context).size.width,
                //         height: MediaQuery.of(context).size.height,
                //         color: Color.fromARGB(82, 0, 0, 0),
                //         child: Center(
                //           child: Padding(
                //             padding: const EdgeInsets.all(28.0),
                //             //this is the pop-up container for info
                //             child: Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.circular(20)),
                //               width: MediaQuery.of(context).size.width,
                //               height: MediaQuery.of(context).size.height,
                //               child: Column(
                //                 children: [
                //                   InkWell(
                //                     onTap: () {
                //                       setState(() {
                //                         showDialog = false;
                //                       });
                //                     },
                //                     child: Text("hide"),
                //                   ),
                //                   Container(
                //                     color: Colors.amber[700],
                //                     height: 20,
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                //     : SizedBox()
              ],
            )),
      ),
    );
  }
}
  // Widget NellyPop() {
  //   return  QuickAlert.(
  //     context: context,
  //     text: "Welcome To Quran!",
  //     type: QuickAlertType.confirm,
  //   );
  // }