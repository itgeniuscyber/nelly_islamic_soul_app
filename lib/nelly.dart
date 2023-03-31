// import 'package:flutter/material.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:intl/intl.dart';
// import 'package:muslim_soul_app/models/aya_of_the%20day.dart';
// import 'package:muslim_soul_app/services/api_services.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ApiServices _apiServices = ApiServices();
//   // AyaOfTheDay? data;

//   @override
//   Widget build(BuildContext context) {
//     var _size = MediaQuery.of(context).size;
//     HijriCalendar.setLocal('ar');
//     var _hijri = HijriCalendar.now();
//     var day = DateTime.now();
//     var format = DateFormat('EEE, d MM yyy');
//     var formatted = format.format(day);

//     // _apiServices.getAyaOfTheDay().then((value) => value);

//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//         children: [
//           Container(
//             height: _size.height * 0.22, //22% of screen
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('assets/background_img.jpg'),
//             )),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   formatted,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//                 RichText(
//                   text: TextSpan(children: <InlineSpan>[
//                     WidgetSpan(
//                       // style: TextStyle(fontSize: 16),
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Text(
//                           _hijri.hDay.toString(),
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     WidgetSpan(
//                       child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text(
//                             _hijri.longMonthName,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           )),
//                     ),
//                     WidgetSpan(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           '${_hijri.hYear} AH',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.only(top: 10, bottom: 20),
//               child: Column(
//                 children: [
//                   FutureBuilder<AyaOfTheDay>(
//                     future: _apiServices.getAyaOfTheDay(),
//                     builder: (context, snapshot) {
//                       switch (snapshot.connectionState) {
//                         case ConnectionState.none:
//                           return Icon(Icons.sync_problem);
//                         case ConnectionState.waiting:
//                         case ConnectionState.active:
//                           return CircularProgressIndicator();
//                         case ConnectionState.done:
//                           return Container(
//                             margin: EdgeInsetsDirectional.all(16),
//                             padding: EdgeInsetsDirectional.all(20),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(32),
//                               color: Colors.white,
//                             ),
//                             child: Column(
//                               children: [
//                                 //Quran of the day Text
//                                 Text(
//                                   'Quran Aya of The Day',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 //divider line optional
//                                 Divider(
//                                   color: Colors.black,
//                                   thickness: 0.5,
//                                 ),

//                                 Text(
//                                   snapshot.data!.arText,
//                                   style: TextStyle(
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 Text(
//                                   snapshot.data!.enTran,
//                                   style: TextStyle(
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 RichText(
//                                   text: TextSpan(
//                                     children: <InlineSpan>[
//                                       WidgetSpan(
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(snapshot.data!.surNumber
//                                               .toString()),
//                                         ),
//                                       ),
//                                       WidgetSpan(
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(snapshot.data!.surEnName),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
