import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileapp/models/marketing.dart';
import 'package:mobileapp/services/marketing_service.dart';

class MarketingScreen extends StatefulWidget {
  MarketingScreen({Key key}) : super(key: key);

  @override
  _MarketingScreenState createState() => _MarketingScreenState();
}

class _MarketingScreenState extends State<MarketingScreen> {
  var _marketings = fetchMarketings();

  _shareStories(int index) async {
    String shareText = "Aproveite o nosso novo ${_marketings[index].product}";

    ByteData bytes = await rootBundle.load(_marketings[index].stories);

    await Share.file(_marketings[index].product, 'nati_share.jpeg',
        bytes.buffer.asUint8List(), 'image/png',
        text: shareText);
  }

  _shareFeed(int index) async {
    String shareText = "Aproveite o nosso novo ${_marketings[index].product}";

    ByteData bytes = await rootBundle.load(_marketings[index].feed);

    await Share.file(_marketings[index].product, 'nati_share.jpeg',
        bytes.buffer.asUint8List(), 'image/png',
        text: shareText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemCount: _marketings.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(_marketings[index].product.toUpperCase()),
                        subtitle: Text(
                          'Novembro/2020',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.asset(_marketings[index].feed),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _marketings[index].description,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            textColor: Colors.orange[800],
                            onPressed: () {
                              _shareStories(index);
                            },
                            child: Text('Stories'.toUpperCase()),
                          ),
                          FlatButton(
                            textColor: Colors.orange[800],
                            onPressed: () {
                              _shareFeed(index);
                            },
                            child: Text('FEED'.toUpperCase()),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
