import 'package:holly_quran/features/home/data/models/duaa/duaa_model.dart';
import 'package:holly_quran/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl();

  @override
  List<DuaaModel> fetchDuaa() {
    return <DuaaModel>[
      DuaaModel(
          id: 1,
          name: "الدعاء عند دخول الحرم ",
          type: "audio",
          url: "media/1.mp3",
          subDuaas: [
            DuaaModel(
                id: 1, name: "الدعاء1", type: "audio", url: "media/1.mp3"),
            DuaaModel(id: 2, name: "الدعاء2", type: "audio", url: "media/2.mp3")
          ]),
      DuaaModel(
          id: 2,
          name: "الدعاء عند رؤية الكعبة ",
          type: "audio",
          url: "media/2.mp3"),
      DuaaModel(
          id: 1,
          name: "كيفية رمي الجمرات",
          type: "video",
          url: "assets/videos/video1.mp4")
    ];
  }
}
