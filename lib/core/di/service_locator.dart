import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() async {
  getIt.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl());
  //getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<AppPreferences>()));
}
