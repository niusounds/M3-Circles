import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as customTabs;
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

import '../circle.dart';

class DetailsPage extends StatelessWidget {
  static Future<void> open({
    @required BuildContext context,
    @required Circle circle,
  }) {
    assert(context != null);
    assert(circle != null);

    return Navigator.pushNamed(
      context,
      '/circle_detail',
      arguments: circle,
    );
  }

  final Circle circle;

  const DetailsPage({
    Key key,
    @required this.circle,
  })  : assert(circle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サークル詳細'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleCard(circle: circle),
      ),
    );
  }
}

class CircleCard extends StatelessWidget {
  final Circle circle;

  const CircleCard({
    Key key,
    @required this.circle,
  })  : assert(circle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Text(
                '${circle.space.group}-${circle.space.number}',
              ),
              title: Text(circle.name),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(circle.pr),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'キーワード: ${circle.keywords.join(', ')}',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                WebsiteButton(
                  url: circle.website.url,
                )
              ],
            ),
          ],
        ),
      );
}

class WebsiteButton extends StatelessWidget {
  final String url;

  const WebsiteButton({
    Key key,
    @required this.url,
  })  : assert(url != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: urlLauncher.canLaunch(url),
      builder: (context, snapshot) {
        final enabled = snapshot.hasData ? snapshot.data : false;
        return FlatButton(
          child: const Text('Webサイトを開く'),
          onPressed: enabled ? _onPressed : null,
        );
      },
    );
  }

  _onPressed() {
    customTabs.launch(
      url,
      option: customTabs.CustomTabsOption(),
    );
  }
}
