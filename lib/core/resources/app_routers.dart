import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:holly_quran/features/contact_us/presentation/contact_us_view.dart';

import '../../features/home/data/models/duaa/duaa_model.dart';
import '../../features/home/presentation/view_models/bottom_navBar/bottom_nav_bar_cubit.dart';
import '../../features/home/presentation/view_models/duaa/duaa/duaa_cubit.dart';
import '../../features/home/presentation/views/duaa_view.dart';
import '../../features/home/presentation/views/home_view.dart';

class Routes {
  // static const String splashRoute = "/";
  static const String homeRoute = "/";
  static const String searchRoute = "/search";
  static const String contactViewRoute = "/contactViewRoute";
  static const String duaaDetailsRoute = "/duaaDetailsRoute";
}

abstract class AppRouters {
  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.homeRoute,
        name: Routes.homeRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => BottomNavBarCubit(),
          child: const HomeView(),
        ),
      ),

      GoRoute(
        path: "${Routes.duaaDetailsRoute}:id1/:id2",
        name: Routes.duaaDetailsRoute,
        builder: (context, state) {
          String duaaId = state.pathParameters['id1'] as String;
          DuaaModel model =
              BlocProvider.of<DuaaCubit>(context).duaas[int.parse(duaaId) - 1];
          return DuaaView(
            //surah:  state.params['id1'] as SurahModel,
            duaa: model,
            id: duaaId,
          );
        },
        //builder: (context, state) => SurahView(),
      ),

      GoRoute(
        path: Routes.contactViewRoute,
        builder: (context, state) => const ContactUsView(),
      ),

      // GoRoute(
      //   path: Routes.bookDetailsRoute,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
      //     child: BookDetailsView(
      //         book: state.extra as BookModel), // to send model when navigate
      //   ),
      // ),
    ],
  );
}
