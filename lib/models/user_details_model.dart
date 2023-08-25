

import 'dart:convert';

List<UserDetailsModel> userDetailsModelFromJson(String str) => List<UserDetailsModel>.from(json.decode(str).map((x) => UserDetailsModel.fromJson(x)));

String userDetailsModelToJson(List<UserDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetailsModel {
    String key;
    List<Group> group;

    UserDetailsModel({
        required this.key,
        required this.group,
    });

    factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
        key: json["key"],
        group: List<Group>.from(json["group"].map((x) => Group.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "group": List<dynamic>.from(group.map((x) => x.toJson())),
    };
}

class Group {
    int year;
    City city;
    String sport;
    String discipline;
    String athlete;
    Country country;
    Gender gender;
    String event;
    Medal medal;

    Group({
        required this.year,
        required this.city,
        required this.sport,
        required this.discipline,
        required this.athlete,
        required this.country,
        required this.gender,
        required this.event,
        required this.medal,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        year: json["Year"],
        city: cityValues.map[json["City"]]!,
        sport: json["Sport"],
        discipline: json["Discipline"],
        athlete: json["Athlete"],
        country: countryValues.map[json["Country"]]!,
        gender: genderValues.map[json["Gender"]]!,
        event: json["Event"],
        medal: medalValues.map[json["Medal"]]!,
    );

    Map<String, dynamic> toJson() => {
        "Year": year,
        "City": cityValues.reverse[city],
        "Sport": sport,
        "Discipline": discipline,
        "Athlete": athlete,
        "Country": countryValues.reverse[country],
        "Gender": genderValues.reverse[gender],
        "Event": event,
        "Medal": medalValues.reverse[medal],
    };
}

enum City {
    // ignore: constant_identifier_names
    BARCELONA
}

final cityValues = EnumValues({
    "Barcelona": City.BARCELONA
});

enum Country {
    // ignore: constant_identifier_names
    GBR
}

final countryValues = EnumValues({
    "GBR": Country.GBR
});

enum Gender {
    // ignore: constant_identifier_names
    MEN,
    // ignore: constant_identifier_names
    WOMEN
}

final genderValues = EnumValues({
    "Men": Gender.MEN,
    "Women": Gender.WOMEN
});

enum Medal {
    // ignore: constant_identifier_names
    BRONZE,
    // ignore: constant_identifier_names
    GOLD,
    // ignore: constant_identifier_names
    SILVER
}

final medalValues = EnumValues({
    "Bronze": Medal.BRONZE,
    "Gold": Medal.GOLD,
    "Silver": Medal.SILVER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
