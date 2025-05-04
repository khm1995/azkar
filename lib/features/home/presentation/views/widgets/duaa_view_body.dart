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

class _DuaaViewBodyState extends State<DuaaViewBody>
    with SingleTickerProviderStateMixin {
  String _searchQuery = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild on tab change to filter list
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            String selectedType = _tabController.index == 0 ? 'audio' : 'video';

            List<DuaaModel> filteredList = state.duaas.where((duaa) {
              return duaa.name
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase()) &&
                  duaa.type == selectedType;
            }).toList();
            return Column(
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
                    ? Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                controller: _tabController,
                                tabs: const [
                                  Tab(text: 'الصوتيات'),
                                  Tab(text: 'المرئيات'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    ListView.builder(
                                      // shrinkWrap: true,
                                      // physics:
                                      //     const NeverScrollableScrollPhysics(),
                                      padding:
                                          const EdgeInsets.all(AppPadding.p8),

                                      itemCount: filteredList.length,
                                      itemBuilder: (context, index) =>
                                          DuaaWidget(duaa: filteredList[index]),
                                    ),
                                    ListView.builder(
                                      // shrinkWrap: true,
                                      // physics:
                                      //     const NeverScrollableScrollPhysics(),
                                      padding:
                                          const EdgeInsets.all(AppPadding.p8),
                                      itemCount: filteredList.length,
                                      itemBuilder: (context, index) =>
                                          DuaaWidget(duaa: filteredList[index]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    // GridView.builder(
                    //         shrinkWrap: true,
                    //         physics: const NeverScrollableScrollPhysics(),
                    //         padding: const EdgeInsets.all(AppPadding.p8),
                    //         gridDelegate:
                    //             const SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount: 1,
                    //           childAspectRatio: 10 / 2,
                    //         ),
                    //         itemCount: filteredList.length,
                    //         itemBuilder: (context, index) =>
                    //             DuaaWidget(duaa: filteredList[index]),
                    //       )
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
            );
          } else {
            return StateRender.fullLoadingScreenImage;
          }
        },
      ),
    );
  }
}
