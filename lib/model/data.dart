import 'dart:convert';

List<DataModels> DataModelsFromJson(String str) =>
    List<DataModels>.from(json.decode(str).map((x) => DataModels.fromJson(x)));

String DataModelsToJson(List<DataModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModels {
  DataModels({
/*     required this.userId,
    required this.id, */
    required this.title,
    required this.body,
  });
/* 
  int userId;
  int id; */
  String title;
  String body;

  factory DataModels.fromJson(Map<String, dynamic> json) => DataModels(
        /* userId: json["userId"],
        id: json["id"], */
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        /*      "userId": userId,
        "id": id, */
        "title": title,
        "body": body,
      };
}
