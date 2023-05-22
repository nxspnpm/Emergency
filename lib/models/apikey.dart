import 'dart:convert';

List<Apikey> apikeyFromJson(String str) => List<Apikey>.from(json.decode(str).map((x) => Apikey.fromJson(x)));

String apikeyToJson(List<Apikey> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apikey {
    int userId;
    int id;
    String title;
    String? body;

    Apikey({
        required this.userId,
        required this.id,
        required this.title,
        this.body,
    });

    factory Apikey.fromJson(Map<String, dynamic> json) => Apikey(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
