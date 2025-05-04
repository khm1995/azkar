class DuaaModel {
  final int id;
  final String name;
  final String url;
  final String type;
  final List<DuaaModel>? subDuaas;

  DuaaModel({
    required this.id,
    required this.name,
    required this.type,
    required this.url,
    this.subDuaas,
  });

  factory DuaaModel.fromJson(Map<String, dynamic> json) {
    return DuaaModel(
      id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
      subDuaas: json['subDuaas'] != null
          ? (json['subDuaas'] as List)
              .map((e) => DuaaModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'type': type,
      'subDuaas': subDuaas?.map((e) => e.toJson()).toList(),
    };
  }
}

// class DuaaModel {
//   final int id;
//   final String name;
//   final String url;
//
//   final String type;
//   final List<DuaaModel>? subDuaas;
//
//   DuaaModel(
//       {required this.id,
//       required this.name,
//       required this.type,
//       required this.url,
//       this.subDuaas});
// }
