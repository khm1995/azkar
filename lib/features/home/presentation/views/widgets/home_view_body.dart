import 'package:flutter/material.dart';
import 'package:holly_quran/core/extension/extensions.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/resources/app_assets.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSize.s1,
            ),
            Center(
              child: SizedBox(
                height: context.height * 0.35,
                child: Lottie.asset(JsonAssets.homeAvatar),
              ),
            ),
            Text(
              "التكتل الماسي", // AppStrings.homeTitle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "عمل - إخلاص - ارتقاء", // AppStrings.homeTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
