import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as customTabs;

import '../circle.dart';

class DetailsPage extends StatelessWidget {
  final Circle circle;

  const DetailsPage({Key key, this.circle}) : super(key: key);

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

  const CircleCard({Key key, this.circle}) : super(key: key);

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
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'キーワード: ${circle.keywords.join(', ')}',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  WebsiteButton(
                    url: circle.website.url,
                  )
                ],
              ),
            ),
          ],
        ),
      );
}

class WebsiteButton extends StatefulWidget {
  final String url;

  const WebsiteButton({Key key, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebsiteButtonState();
}

class WebsiteButtonState extends State<WebsiteButton> {
  bool enabled;

  @override
  void initState() {
    super.initState();
    enabled = false;

    urlLauncher.canLaunch(widget.url).then((result) {
      setState(() {
        enabled = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text('Webサイトを開く'),
      onPressed: enabled
          ? () async {
              if (await urlLauncher.canLaunch(widget.url)) {
                await customTabs.launch(
                  widget.url,
                  option: customTabs.CustomTabsOption(),
                );
              }
            }
          : null,
    );
  }
}
