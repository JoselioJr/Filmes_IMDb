import 'dart:convert';
import 'package:hive/hive.dart';

part 'film_model.g.dart';

Film filmFromJson(String str) => Film.fromJson(json.decode(str));

String filmToJson(Film data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class Film extends HiveObject {
    @HiveField(0)
    String title;
    @HiveField(1)
    int year;
    @HiveField(2)
    int rank;
    @HiveField(3)
    String actors;
    @HiveField(5)
    String imgPoster;

    Film({
        required this.title,
        required this.year,
        required this.rank,
        required this.actors,
        required this.imgPoster,
    });

    factory Film.fromJson(Map<String, dynamic> json) => Film(
        title: json["#TITLE"],
        year: json["#YEAR"],
        rank: json["#RANK"],
        actors: json["#ACTORS"],
        imgPoster: json["#IMG_POSTER"],
    );

    Map<String, dynamic> toJson() => {
        "#TITLE": title,
        "#YEAR": year,
        "#RANK": rank,
        "#ACTORS": actors,
        "#IMG_POSTER": imgPoster,
    };
}
