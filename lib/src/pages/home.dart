import 'package:flutter/material.dart';
import 'package:m3circles/data.dart';
import 'package:m3circles/pages.dart';
import 'package:m3circles/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  final title = 'M3 Circles';

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
    DetailsPage.open(
      context: context,
      circle: circle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        // 読み込み中の表示
        ? Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        // 読み込み完了後の表示
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(text: '第一展示場'),
                    Tab(text: '第二展示場'),
                    Tab(text: 'お気に入り'),
                  ],
                ),
                title: Text(widget.title),
              ),
              body: TabBarView(
                children: <Widget>[
                  CircleList(
                    circles: firstHall,
                    onToggleFavorite: _onToggleFavorite,
                    onTap: _moveToDetails,
                  ),
                  CircleList(
                    circles: secondHall,
                    onToggleFavorite: _onToggleFavorite,
                    onTap: _moveToDetails,
                  ),
                  favorites.length > 0
                      ? CircleList(
                          circles: favorites,
                          onToggleFavorite: _onToggleFavorite,
                          onTap: _moveToDetails,
                        )
                      : Center(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: const Text(
                              'お気に入りに登録されているサークルはありません。サークルリストの☆をタップしてお気に入りに登録してください。',
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.search),
                onPressed: () async {
                  // 検索画面に遷移する
                  await SearchPage.open(
                    context: context,
                    masterData: allCircles,
                  );
                  // 戻ってきたら状態を更新する
                  setState(() {});
                },
              ),
            ),
          );
  }
}
