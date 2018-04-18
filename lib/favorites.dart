import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'circle.dart';

/// お気に入りに入れたサークルを保持する。
List<Circle> favorites = new List();

/// サークルのお気に入り状態を切り替える。
toggleFavorite(Circle circle, bool willBeFavorited) {
  if (willBeFavorited) {
    favorites.add(circle);
  } else {
    favorites.remove(circle);
  }

  _saveFavorites();
}

Future<void> loadFavorites() async {
  try {
    final file = await _favoritesFile;
    if (await file.exists()) {
      final jsonStr = await file.readAsString();
      favorites = Circle.fromJson(jsonStr);
    }
  } catch (e) {
    print(e);
  }
}

Future<void> _saveFavorites() async {
  try {
    final file = await _favoritesFile;
    final jsonStr = json.encode(favorites);
    return file.writeAsString(jsonStr);
  } catch (e) {
    print(e);
  }
}

Future<File> get _favoritesFile async {
  final directory = await getApplicationDocumentsDirectory();
  return new File('${directory.path}/favorites.json');
}
