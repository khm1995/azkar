import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int currentIndex = 3;
  int allItemsCount = 3;
  // changeIndex function
  void changeIndex({required int index}) {
    currentIndex = index;
    emit(BottomNavBarInitial()); // to listen for change
  }
}
