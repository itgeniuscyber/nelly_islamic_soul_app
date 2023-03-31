import 'package:flutter/material.dart';
import 'package:muslim_soul_app/services/api_services.dart';

import '../Widgets/juz_custom_tile.dart';
import '../constants/Constants.dart';
import '../models/juz.dart';

class JuzScreen extends StatelessWidget {
  ApiServices apiServices = ApiServices();
  static const String id = 'juz_screen';
  JuzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<JuzModel>(
            future: apiServices.getJuzz(Constants.juzIndex!),
            builder: (context, AsyncSnapshot<JuzModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                print('${snapshot.data!.juzAyahs.length} length');
                return ListView.builder(
                  itemCount: snapshot.data!.juzAyahs.length,
                  itemBuilder: (context, index) {
                    return JuzCustomTile(
                      list: snapshot.data!.juzAyahs,
                      index: index,
                    );
                  },
                );
              } else {
                return const Center(child: Text('Data Not Found'));
              }
            }),
      ),
    );
  }
}
