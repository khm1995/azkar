import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:holly_quran/core/helper_functions/functions.dart';
import 'package:holly_quran/core/resources/app_assets.dart';
import 'package:holly_quran/core/resources/app_colors.dart';
import 'package:holly_quran/core/resources/app_fonts.dart';
import 'package:holly_quran/core/resources/app_routers.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:holly_quran/features/home/data/models/duaa/duaa_model.dart';

class SubDuaaListTileWidget extends StatelessWidget {
  final DuaaModel duaa;
  final bool? isSubDuaa;
  const SubDuaaListTileWidget({required this.duaa, super.key, this.isSubDuaa});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(
          Routes.duaaDetailsRoute,
          pathParameters: {'id1': "${duaa.id}"},
          extra: duaa.toJson(),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: AppMargin.m8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isSubDuaa == true
                        ? Icon(FontAwesomeIcons.headphones)
                        : Container(
                            width:
                                isSubDuaa == true ? AppSize.s30 : AppSize.s50,
                            height:
                                isSubDuaa == true ? AppSize.s30 : AppSize.s50,
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
                                  .copyWith(
                                      fontSize: isSubDuaa == true
                                          ? FontSize.s12
                                          : FontSize.s16),
                            ),
                          ),
                    const SizedBox(width: AppSize.s10),
                    Text(
                      duaa.name,
                      textAlign: TextAlign.center,
                      style: isSubDuaa == true
                          ? Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontSize: FontSize.s16)
                          : Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                isSubDuaa == true
                    ? SizedBox.shrink()
                    : Column(
                        children: [
                          duaa.type == "audio"
                              ? Icon(
                                  Icons.audiotrack_outlined,
                                  size: isSubDuaa == true ? 16 : 25,
                                )
                              : Icon(FontAwesomeIcons.display, size: 25),
                          // Row(
                          //   children: [
                          //     Text(arNumber("${duaa.id}")),
                          //     const SizedBox(
                          //       width: AppSize.s4,
                          //     ),
                          //     const Text(AppStrings.aya),
                          //   ],
                          // ),
                        ],
                      ),
              ],
            ),
            Divider(
              color: isSubDuaa == true
                  ? AppColors.primary.withAlpha(100)
                  : AppColors.primary,
              indent: isSubDuaa == true ? AppSize.s30 : AppSize.s0,
              endIndent: isSubDuaa == true ? AppSize.s30 : AppSize.s0,
            ),
          ],
        ),
      ),
    );
  }
}
