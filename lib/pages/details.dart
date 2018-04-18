import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../circle.dart';

class DetailsPage extends StatelessWidget {
  final Circle circle;

  const DetailsPage({Key key, this.circle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('サークル詳細'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new CircleCard(circle: circle),
      ),
    );
  }
}

class CircleCard extends StatelessWidget {
  final Circle circle;

  const CircleCard({Key key, this.circle}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new ListTile(
              leading: new Text(
                '${circle.space.group}-${circle.space.number}',
              ),
              title: new Text(circle.name),
            ),
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Text(circle.pr),
            ),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: new Text(
                'キーワード: ${circle.keywords.join(', ')}',
                style: new TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
            new ButtonTheme.bar(
              child: new ButtonBar(
                children: <Widget>[
                  new WebsiteButton(
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

    canLaunch(widget.url).then((result) {
      setState(() {
        enabled = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: const Text('Webサイトを開く'),
      onPressed: enabled
          ? () async {
              if (await canLaunch(widget.url)) {
                await launch(widget.url);
              }
            }
          : null,
    );
  }
}
