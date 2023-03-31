class AyaOfTheDay {
  final String arText;
  final String enTran;
  final String surEnName;
  final int? surNumber;

  AyaOfTheDay(
      {required this.arText,
      required this.enTran,
      required this.surEnName,
      this.surNumber});

  factory AyaOfTheDay.fromJson(Map<String, dynamic> json) {
    return AyaOfTheDay(
      arText: json['data'][0]['text'],
      enTran: json['data'][2]['text'],
      surEnName: json['data'][2]['surah']['englishName'],
      surNumber: json['data'][2]['numberInSurah'],
    );
  }
}
