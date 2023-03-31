import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:muslim_soul_app/models/aya_of_the%20day.dart';
import 'package:muslim_soul_app/services/api_services.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/Constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiServices = ApiServices();
  // AyaOfTheDay? data;
  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

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
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE, d MM yyy');
    var formatted = format.format(day);

    // _apiServices.getAyaOfTheDay().then((value) => value);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/islam1.png'),
            fit: BoxFit.fitHeight,

            // opacity: 0.5,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            hoverColor: Color.fromARGB(255, 76, 235, 81),
            backgroundColor: Constants.kPrimary,
            onPressed: () {
              NellyPop(
                QuickAlertType.info,
                "Islamic soul",
                "Asalam Aleikum warahamatulilah wabarakatuh, A motivation by Twaha's Granie (Nakalemba Zariah)... Kindly Share to the Rest, Enjoy and suggest what the developer can add for you!!! Thanks  ",
              );
            },
            label: const Text("Proud Moslem"),
            icon: Icon(Icons.menu_book_rounded),
          ),
          body: Column(
            children: [
              Container(
                height: _size.height * 0.22, //22% of screen
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/q1.png'),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatted,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: <InlineSpan>[
                        WidgetSpan(
                          // style: TextStyle(fontSize: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.hDay.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                _hijri.longMonthName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${_hijri.hYear} AH',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),

              // lotie animation
              Container(
                  height: 100,
                  width: _size.width,
                  child: Lottie.asset('lottie/arabic_word.json')),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Column(
                    children: [
                      FutureBuilder<AyaOfTheDay>(
                        future: _apiServices.getAyaOfTheDay(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Icon(Icons.sync_problem);
                            case ConnectionState.waiting:
                            case ConnectionState.active:
                              return const CircularProgressIndicator();
                            case ConnectionState.done:
                              return Container(
                                margin: const EdgeInsetsDirectional.all(16),
                                padding: const EdgeInsetsDirectional.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                        offset: Offset(0, 1),
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    //Quran of the day Text
                                    const Text(
                                      'Quran Aya of The Day',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    //divider line optional
                                    const Divider(
                                      color: Colors.black,
                                      thickness: 0.5,
                                    ),

                                    Text(
                                      snapshot.data!.arText,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      snapshot.data!.enTran,
                                      style: const TextStyle(
                                          color: Colors.black54, fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <InlineSpan>[
                                          WidgetSpan(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data!.surNumber
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data!.surEnName,
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
