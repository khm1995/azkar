import 'package:flutter/material.dart';
import 'package:holly_quran/core/helper_functions/functions.dart';
import 'package:holly_quran/core/resources/app_assets.dart';
import 'package:holly_quran/core/resources/app_colors.dart';
import 'package:holly_quran/core/resources/app_fonts.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:holly_quran/features/home/data/models/duaa/duaa_model.dart';
import 'package:holly_quran/features/home/presentation/views/widgets/duaa_list_tile_widget.dart';

class DuaaWidget extends StatelessWidget {
  final DuaaModel duaa;

  const DuaaWidget({required this.duaa, super.key});

  @override
  Widget build(BuildContext context) {
    if (duaa.type == "audio" && duaa.subDuaas?.isNotEmpty == true) {
      return Column(
        children: [
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide.none,
            ),
            childrenPadding: EdgeInsets.symmetric(horizontal: AppSize.s20),
            leading: Container(
              width: AppSize.s50,
              height: AppSize.s50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.star),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                arNumber("${duaa.id}"),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: FontSize.s16),
              ),
            ),
            trailing: Icon(
              Icons.playlist_play_outlined,
              size: 25,
            ),
            enableFeedback: true,
            title: Text(
              duaa.name,
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            children: duaa.subDuaas!.map((subDuaa) {
              return SubDuaaListTileWidget(
                duaa: subDuaa,
                isSubDuaa: true,
              );
            }).toList(),
          ),
          Divider(color: AppColors.primary),
        ],
      );
    }
    return SubDuaaListTileWidget(duaa: duaa);
  }
}
