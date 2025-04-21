import 'package:flutter/material.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:holly_quran/features/common_widgets/quran_app_bar.dart';

import '../../data/models/duaa/duaa_model.dart';
import 'widgets/duaa_view_body.dart';

class DuaaView extends StatelessWidget {
  final DuaaModel duaa;
  final String id;
  const DuaaView({super.key, required this.duaa, required this.id});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSize.s0),
          child: QuranAppBar(title: " ${duaa.name}"),
        ),
        body: DuaaViewBody(),
      ),
    );
  }
}
