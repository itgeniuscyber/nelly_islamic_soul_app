import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:muslim_soul_app/models/Qari.dart';
import 'package:muslim_soul_app/models/aya_of_the%20day.dart';
import 'package:muslim_soul_app/models/juz.dart';
import 'package:muslim_soul_app/models/sajda.dart';
import 'package:muslim_soul_app/models/translation.dart';

import '../models/surah.dart';

class ApiServices {
  final endPointUrl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  // Aya of the Day API  server requests
  Future<AyaOfTheDay> getAyaOfTheDay() async {
    //for Random Aya we need to generate Random Number
    //(1, 6237) from 1 to 6237
    String url =
        "http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall ";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJson(json.decode(response.body));
    } else {
      print("Failed To Load");
      throw Exception("Failed To Load Post");
    }
  }

  int random(min, max) {
    var rn = Random();
    return min + Random().nextInt(max - min);
  }

// api for Surahs
  Future<List<Surah>> getSurah() async {
    Response res = await http.get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      print('ol ${list.length}');
      return list;
    } else {
      throw ('"Cant get Surah');
    }
  }

// Api for Sajda
  Future<SajdaList> getSajda() async {
    String url = "http://api.alquran.cloud/v1/sajda/en.asad ";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return SajdaList.fromJSON(json.decode(response.body));
    } else {
      print("Failed To Load");
      throw Exception("Failed To Load");
    }
  }
// Api for Juzz

  Future<JuzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani -";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return JuzModel.fromJSON(json.decode(response.body));
    } else {
      print("Failed To Load");
      throw Exception("Failed To load Post");
    }
  }

//Sura Translation

  Future<SurahTranslationList> getTranslation(
      int index, int translationIndex) async {
    String lan = "";
    // check a language to display from Api
    if (translationIndex == 0) {
      lan = "english_saheeh";
    } else if (translationIndex == 1) {
      lan = "hindi_omari";
    } else if (translationIndex == 2) {
      lan = "urdu_junagarhi";
    } else if (translationIndex == 3) {
      lan = "luganda_foundation";
    }

    // lan = "urdu_junagarhi";

    final url = "https://quranenc.com/api/translation/sura/$lan/$index";
    var res = await http.get(Uri.parse(url));

    return SurahTranslationList.fromJSON(json.decode(res.body));
  }

// Qarilist or Audio List
  List<Qari> qariList = [];

  Future<List<Qari>> getQariList() async {
    final url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));

    jsonDecode(res.body).forEach((element) {
      // 20nis not Mandatory we can always change the number ie to 157
      if (qariList.length < 157) qariList.add(Qari.fromjson(element));
    });

    qariList.sort((a, b) => a.name!.compareTo(b.name!));
    return qariList;
  }
}
