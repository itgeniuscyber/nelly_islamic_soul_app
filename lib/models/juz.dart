// class JuzModel
class JuzModel {
  final int juzNumber;
  final List<JuzAyahs> juzAyahs;

  JuzModel({required this.juzNumber, required this.juzAyahs});
  factory JuzModel.fromJSON(Map<String, dynamic> json) {
    Iterable juzAyahs = json['data']['ayahs'];
    List<JuzAyahs> juzAyahsList =
        juzAyahs.map((e) => JuzAyahs.fromJSON(e)).toList();
    return JuzModel(
      juzAyahs: juzAyahsList,
      juzNumber: json['data']['number'],
    );
  }
}

//class JuzAyahs

class JuzAyahs {
  final ayahsText;
  final ayahNumber;
  final surName;

  JuzAyahs(
      {required this.ayahsText,
      required this.ayahNumber,
      required this.surName});

  factory JuzAyahs.fromJSON(Map<String, dynamic> json) {
    return JuzAyahs(
      ayahsText: json['text'],
      ayahNumber: json['number'],
      surName: json['surah']['name'],
    );
  }
}
