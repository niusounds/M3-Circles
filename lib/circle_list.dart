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
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      itemCount: circles.length,
      separatorBuilder: (context, i) => const Divider(),
      itemBuilder: (context, index) {
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
          trailing: IconButton(
            icon: Icon(isFavorited ? Icons.star : Icons.star_border),

            // お気に入り状態変更のコールバック
            onPressed: () {
              if (onToggleFavorite != null) {
                onToggleFavorite(circle, !isFavorited);
              }
            },
          ),

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
