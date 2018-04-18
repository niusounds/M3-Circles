import 'package:flutter/material.dart';
import '../circle.dart';
import 'details.dart';

/// 詳細ページに移動する。
moveToDetailPage(BuildContext context, Circle circle) {
  return Navigator.push(
    context,
    new MaterialPageRoute(
      builder: (context) => new DetailsPage(
            circle: circle,
          ),
    ),
  );
}
