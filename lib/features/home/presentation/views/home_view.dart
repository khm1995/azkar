import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holly_quran/core/resources/app_assets.dart';
import 'package:holly_quran/core/resources/app_colors.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:holly_quran/features/common_widgets/app_bar.dart';
import 'package:holly_quran/features/common_widgets/bottom_navigation_bar.dart';
import 'package:holly_quran/features/contact_us/presentation/widgets/contact_us_view_body.dart';
import 'package:holly_quran/features/home/presentation/view_models/bottom_navBar/bottom_nav_bar_cubit.dart';
import 'package:holly_quran/features/home/presentation/views/widgets/duaa_view_body.dart';
import 'package:holly_quran/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarWidgets = <Widget>[
      const DuaaViewBody(),
      const ContactUsViewBody(),
    ];

    // Determine if the keyboard is open
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          BottomNavBarCubit cubit = BlocProvider.of<BottomNavBarCubit>(context);
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(AppSize.s0),
              child: MyAppBar(title: ''),
            ),
            body: cubit.currentIndex < cubit.allItemsCount
                ? navBarWidgets[cubit.currentIndex]
                : HomeViewBody(),
            floatingActionButton: isKeyboardOpen
                ? null // Don't show the FAB when the keyboard is open
                : SizedBox(
                    height: AppSize.s80,
                    width: AppSize.s80,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      shape: const CircleBorder(),
                      child: Image.asset(
                        ImageAssets.home,
                        fit: BoxFit.cover,
                        width: AppSize.s50,
                      ),
                      onPressed: () {
                        cubit.changeIndex(index: cubit.allItemsCount);
                      },
                    ),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:
                AppBottomNavigationBar(cubit: cubit, state: state),
          );
        },
      ),
    );
  }
}
