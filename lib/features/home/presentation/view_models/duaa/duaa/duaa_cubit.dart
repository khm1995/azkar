import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holly_quran/features/home/data/repos/home_repo.dart';

import '../../../../data/models/duaa/duaa_model.dart';

part 'duaa_state.dart';

class DuaaCubit extends Cubit<DuaaState> {
  final HomeRepo homeRepo;
  DuaaCubit(this.homeRepo) : super(DuaaInitial());

  List<DuaaModel> duaas = [];

  Future<void> fetchDuaa() async {
    var result = homeRepo.fetchDuaa();

    duaas = result;
    //
    emit(DuaaSuccess(result));
  }
}
