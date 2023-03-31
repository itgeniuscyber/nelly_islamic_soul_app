import 'package:flutter/material.dart';
import 'package:muslim_soul_app/models/juz.dart';

class JuzCustomTile extends StatelessWidget {
  JuzCustomTile({super.key, required this.list, required this.index});

  final List<JuzAyahs> list;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(list[index].ayahNumber.toString()),
          Text(
            list[index].ayahsText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
