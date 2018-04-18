import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'circle.dart';
import 'circle_list.dart';
import 'favorites.dart';
import 'pages/search.dart';
import 'pages/transition.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) => new MaterialApp(
        title: 'M3 Circles',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  final title = 'M3 Circles';

  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyHomePage> {
  // 読み込み中かどうか
  bool loading = true;

  List<Circle> allCircles;

  // 第一展示場
  List<Circle> firstHall;

  // 第二展示場
  List<Circle> secondHall;

  @override
  void initState() {
    super.initState();

    // サークルデータを読み込む
    Circle.loadAllCircles().then((circles) {
      setState(() {
        allCircles = circles;
        firstHall = circles.where((circle) => circle.hall == '第一展示場').toList();
        secondHall =
            circles.where((circle) => circle.hall.startsWith('第二展示場')).toList();
        loading = false;
      });
    });

    loadFavorites().then((_) {
      print(favorites);
    });
  }

  _onToggleFavorite(Circle circle, bool willBeFavorited) async {
    setState(() {
      toggleFavorite(circle, willBeFavorited);
    });
  }

  _moveToDetails(Circle circle) {
    moveToDetailPage(context, circle);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        // 読み込み中の表示
        ? new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
            ),
            body: new Center(
              child: new CircularProgressIndicator(),
            ),
          )
        // 読み込み完了後の表示
        : new DefaultTabController(
            length: 3,
            child: new Scaffold(
              appBar: new AppBar(
                bottom: new TabBar(
                  tabs: <Widget>[
                    new Tab(text: '第一展示場'),
                    new Tab(text: '第二展示場'),
                    new Tab(text: 'お気に入り'),
                  ],
                ),
                title: new Text(widget.title),
              ),
              body: new TabBarView(
                children: <Widget>[
                  new CircleList(
                    circles: firstHall,
                    onToggleFavorite: _onToggleFavorite,
                    onTap: _moveToDetails,
                  ),
                  new CircleList(
                    circles: secondHall,
                    onToggleFavorite: _onToggleFavorite,
                    onTap: _moveToDetails,
                  ),
                  favorites.length > 0
                      ? new CircleList(
                          circles: favorites,
                          onToggleFavorite: _onToggleFavorite,
                          onTap: _moveToDetails,
                        )
                      : new Center(
                          child: new Container(
                            padding: EdgeInsets.all(16.0),
                            child: const Text(
                              'お気に入りに登録されているサークルはありません。サークルリストの☆をタップしてお気に入りに登録してください。',
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ],
              ),
              floatingActionButton: new FloatingActionButton(
                child: new Icon(Icons.search),
                onPressed: () async {
                  // 検索画面に遷移する
                  await Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new SearchPage(
                            masterData: allCircles,
                          ),
                    ),
                  );
                  // 戻ってきたら状態を更新する
                  setState(() {});
                },
              ),
            ),
          );
  }
}
