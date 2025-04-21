import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:holly_quran/core/helper_functions/functions.dart';
import 'package:holly_quran/core/resources/app_assets.dart';
import 'package:holly_quran/core/resources/app_colors.dart';
import 'package:holly_quran/core/resources/app_fonts.dart';
import 'package:holly_quran/core/resources/app_routers.dart';
import 'package:holly_quran/core/resources/app_strings.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:holly_quran/features/home/data/models/duaa/duaa_model.dart';

class DuaaWidget extends StatelessWidget {
  final DuaaModel duaa;

  const DuaaWidget({required this.duaa, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.duaaDetailsRoute,
            pathParameters: {'id1': "${duaa.id}", 'id2': '$duaa'});
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
                    Container(
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
                    const SizedBox(width: AppSize.s10),
                    Text(
                      duaa.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(duaa.type),
                    Row(
                      children: [
                        Text(arNumber("${duaa.id}")),
                        const SizedBox(
                          width: AppSize.s4,
                        ),
                        const Text(AppStrings.aya),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
