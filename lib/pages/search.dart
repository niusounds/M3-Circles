import 'package:flutter/material.dart';

import '../circle.dart';
import '../circle_list.dart';
import '../favorites.dart';
import 'transition.dart';

bool insensitiveEqual(String a, String b) => a.toUpperCase() == b.toUpperCase();
bool insensitiveContains(String a, String b) =>
    a.toUpperCase().contains(b.toUpperCase());

class SearchPage extends StatefulWidget {
  final List<Circle> masterData;

  const SearchPage({
    Key key,
    this.masterData,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  // 検索結果を格納する
  List<Circle> _filtered = [];

  _onToggleFavorite(Circle circle, bool willBeFavorited) {
    setState(() {
      toggleFavorite(circle, willBeFavorited);
    });
  }

  _search(String searchText) {
    setState(() {
      // 検索キーワードが1文字以上の場合は検索を行う
      if (searchText.length > 0) {
        // 検索結果
        _filtered = widget.masterData
            .where((circle) =>
                circle.keywords
                    .any((keyword) => insensitiveEqual(keyword, searchText)) ||
                insensitiveContains(circle.pr, searchText) ||
                insensitiveContains(circle.name, searchText))
            .toList();
      } else {
        _filtered = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 検索入力欄
        title: TextField(
          autofocus: true,
          style: const TextStyle(
            color: Colors.white,
          ),

          // 入力値が変更されたら検索
          onChanged: _search,
        ),
      ),
      body: CircleList(
        circles: _filtered,
        onToggleFavorite: _onToggleFavorite,
        onTap: (circle) {
          moveToDetailPage(context, circle);
        },
      ),
    );
  }
}
