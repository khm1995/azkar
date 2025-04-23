import 'package:flutter/material.dart';
import 'package:holly_quran/core/extension/extensions.dart';
import 'package:holly_quran/core/resources/app_assets.dart';
import 'package:holly_quran/core/resources/app_strings.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:lottie/lottie.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s20,
            ),
            Center(
              child: SizedBox(
                width: context.height * 0.35,
                child: Lottie.asset(JsonAssets.homeAvatar),
              ),
            ),
            Text(
              AppStrings.homeTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: AppSize.s10),
          ],
        ),
      ),
    );
  }
}
