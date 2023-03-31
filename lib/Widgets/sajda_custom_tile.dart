import 'package:flutter/material.dart';
import 'package:muslim_soul_app/models/sajda.dart';

Widget SajdaCustomTile(SajdaAyat sajdaAyat, context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  sajdaAyat.juzNumber.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //sajda english name surah
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${sajdaAyat.surahEnglishName}\n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      //sajda revelation Type
                      TextSpan(
                        text: '${sajdaAyat.revelationType}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const Spacer(),
            Text(
              sajdaAyat.surahName,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
