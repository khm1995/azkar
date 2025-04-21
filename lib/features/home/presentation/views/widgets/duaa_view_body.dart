import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holly_quran/core/extension/extensions.dart';
import 'package:holly_quran/core/resources/app_assets.dart';
import 'package:holly_quran/core/resources/values_manager.dart';
import 'package:holly_quran/features/common_widgets/state_renderer/state_render.dart';

import '../../../data/models/duaa/duaa_model.dart';
import '../../view_models/duaa/duaa/duaa_cubit.dart';
import 'duaa_widget.dart';

class DuaaViewBody extends StatefulWidget {
  const DuaaViewBody({super.key});

  @override
  State<DuaaViewBody> createState() => _DuaaViewBodyState();
}

class _DuaaViewBodyState extends State<DuaaViewBody> {
  String _searchQuery = '';
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
      child: BlocBuilder<DuaaCubit, DuaaState>(
        builder: (context, state) {
          if (state is DuaaSuccess) {
            List<DuaaModel> filteredList = state.duaas
                .where((duaa) => duaa.name
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()))
                .toList();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'بحث..',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  filteredList.isNotEmpty
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(AppPadding.p8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 10 / 2,
                          ),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) =>
                              DuaaWidget(duaa: filteredList[index]),
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'لا توجد نتائج بحث',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ],
              ),
            );
          } else {
            return StateRender.fullLoadingScreenImage;
          }
        },
      ),
    );
  }
}
