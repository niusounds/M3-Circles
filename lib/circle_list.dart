import 'package:flutter/material.dart';

import 'circle.dart';
import 'favorites.dart';

class CircleList extends StatelessWidget {
  final List<Circle> circles;
  final onTap;
  final onToggleFavorite;

  const CircleList({
    Key key,
    this.circles,
    this.onTap,
    this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16.0),
      itemCount: circles.length * 2, // アイテム数の2倍の行数を描画する
      itemBuilder: (context, i) {
        // 奇数行にセパレーターを描画する
        if (i % 2 == 1) {
          return Divider();
        }

        // 実際のインデックス数
        final index = i ~/ 2;
        final circle = circles[index];
        final isFavorited = favorites.contains(circle);

        return ListTile(
          // スペース番号
          leading: Text(
            '${circle.space.group} -\n${circle.space.number}',
          ),

          // サークル名
          title: Text(circle.name),

          // 説明文
          subtitle: Text(
            circle.pr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // お気に入り状態
          trailing: favorites != null
              ? IconButton(
                  icon: Icon(isFavorited ? Icons.star : Icons.star_border),

                  // お気に入り状態変更のコールバック
                  onPressed: () {
                    if (onToggleFavorite != null) {
                      onToggleFavorite(circle, !isFavorited);
                    }
                  },
                )
              : Space(),

          // サークル選択時のコールバック
          onTap: () {
            if (onTap != null) {
              onTap(circle);
            }
          },
        );
      },
    );
  }
}
