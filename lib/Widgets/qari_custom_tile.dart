import 'package:flutter/material.dart';
import 'package:muslim_soul_app/constants/Constants.dart';

import '../models/Qari.dart';

class QariCustomTile extends StatefulWidget {
  final Qari qari;
  final VoidCallback ontap;

  const QariCustomTile({super.key, required this.qari, required this.ontap});

  @override
  State<QariCustomTile> createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black12,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.qari.name!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.star_outlined,
                color: Constants.kPrimary,
              ),
              // Image.asset('lottie/qa1.json'),
            ],
          ),
        ),
      ),
    );
  }
}
