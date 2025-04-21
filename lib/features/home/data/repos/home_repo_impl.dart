import 'package:holly_quran/features/home/data/models/duaa/duaa_model.dart';
import 'package:holly_quran/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl();

  @override
  List<DuaaModel> fetchDuaa() {
    return <DuaaModel>[
      DuaaModel(id: 1, name: "دعاء الأول ", type: "sound", url: "media/1.mp3"),
      DuaaModel(id: 2, name: "دعاء الثاني ", type: "sound", url: "media/2.mp3")
    ];
  }
}
