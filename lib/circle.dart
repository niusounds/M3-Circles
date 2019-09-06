import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quiver/core.dart';

bool _deepEqual(List<dynamic> a, List<dynamic> b) {
  // 長さが違ったらfalse
  if (a.length != b.length) return false;

  // いずれかの要素が違ったらfalse
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }

  // 全て同じ
  return true;
}

class Circle {
  final String hall;
  final Space space;
  final Website website;
  final String name;
  final String pronounciation;
  final String genre;
  final List<String> keywords;
  final String pr;

  Circle(
      {this.hall,
      this.space,
      this.website,
      this.name,
      this.pronounciation,
      this.genre,
      this.keywords,
      this.pr});

  Map toJson() {
    return Map()
      ..['hall'] = hall
      ..['space'] = space
      ..['website'] = website
      ..['name'] = name
      ..['pronounciation'] = pronounciation
      ..['genre'] = genre
      ..['keywords'] = keywords
      ..['pr'] = pr;
  }

  bool operator ==(o) =>
      o is Circle &&
      hall == o.hall &&
      space == o.space &&
      website == o.website &&
      name == o.name &&
      pronounciation == o.pronounciation &&
      genre == o.genre &&
      _deepEqual(keywords, o.keywords) &&
      pr == o.pr;
  int get hashCode => hashObjects([
        hall,
        space,
        website,
        name,
        pronounciation,
        genre,
        keywords,
        pr,
      ]);

  static List<Circle> fromJson(String jsonStr) {
    final List<dynamic> rawCircles = json.decode(jsonStr);

    final circles = rawCircles.map((rawCircle) {
      return Circle(
        name: rawCircle['name'],
        pronounciation: rawCircle['pronounciation'],
        pr: rawCircle['pr'],
        keywords: List.castFrom(rawCircle['keywords']),
        hall: rawCircle['hall'],
        genre: rawCircle['genre'],
        space: Space(
          group: rawCircle['space']['group'],
          number: rawCircle['space']['number'],
        ),
        website: Website(
          name: rawCircle['website']['name'],
          url: rawCircle['website']['url'],
        ),
      );
    }).toList();

    return circles;
  }

  static Future<List<Circle>> loadAllCircles() async {
    final circlesString = await rootBundle.loadString('assets/circles.json');
    return Circle.fromJson(circlesString);
  }
}

class Space {
  final String group;
  final String number;

  Space({this.group, this.number});

  Map toJson() {
    return Map()
      ..['group'] = group
      ..['number'] = number;
  }

  bool operator ==(o) => o is Space && group == o.group && number == o.number;
  int get hashCode => hash2(group.hashCode, number.hashCode);
}

class Website {
  final String url;
  final String name;

  Website({this.url, this.name});

  Map toJson() {
    return Map()
      ..['url'] = url
      ..['name'] = name;
  }

  bool operator ==(o) => o is Website && url == o.url && name == o.name;
  int get hashCode => hash2(url.hashCode, name.hashCode);
}
