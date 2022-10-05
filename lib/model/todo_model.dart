import 'dart:convert';

Map<String, TodoModel> todoModelFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, TodoModel>(k, TodoModel.fromJson(v)));

String todoModelToJson(Map<String, TodoModel> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class TodoModel {
    TodoModel({
        required this.description,
        required this.title,
    });

    String description;
    String title;

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        description: json["description"] == null ? null : json["description"],
        title: json["title"] == null ? null : json["title"],
    );

    Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "title": title == null ? null : title,
    };
}
