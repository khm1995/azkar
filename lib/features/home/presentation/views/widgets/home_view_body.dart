import 'package:flutter/material.dart';
import 'package:holly_quran/core/extension/extensions.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_strings.dart';
import '../../../data/models/duaa/group_model.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
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
              AppStrings.homeTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}

Card buildContainerScreen(GroupModel groupModel) {
  return Card(
    margin: EdgeInsets.all(AppSize.s8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 4,
    child: Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              groupModel.photo,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),

          // Name
          Container(
            color: const Color(0xFF1E2D5C), // Blue background
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              groupModel.officer,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              groupModel.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Logo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              groupModel.logo,
              height: 60,
            ),
          ),

          // Phone Number
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              groupModel.phone,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
