import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stnatura/models/order.dart';
import 'package:stnatura/services/bitly_service.dart';

class OrderScreen extends StatefulWidget {
  final Order order;

  const OrderScreen({Key key, this.order}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Step> steps = [
    Step(
        title: Text('Confirmado'),
        content: Column(children: []),
        isActive: true,
        state: StepState.disabled),
    Step(
        title: Text('Recebido'),
        content: Column(children: []),
        isActive: true,
        state: StepState.disabled),
    Step(
        title: Text('Entregue'),
        content: Column(children: []),
        isActive: true,
        state: StepState.disabled),
  ];

  _share() {
    BitLyRequests()
        .fetchShortLink(
            "https://storm-tech.herokuapp.com/products?reseller=XFTH3478")
        .then((value) async {
      String shareText =
          "Oie, Nat aqui de novo! Queria sabe contigo se gostou da experiência. Fala pra mim de 0 a 10 qual as chances de você recomendar a gente pra algum amigo ou alguém da família?";

      ByteData bytes = await rootBundle.load('assets/nati_share.jpeg');

      await Share.file('Aline Pilot', 'nati_share.jpeg',
          bytes.buffer.asUint8List(), 'image/jpeg',
          text: shareText);

      print(shareText);
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Pedido #${widget.order.id.toString()}"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: _share,
              color: Colors.white,
            )
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              type: StepperType.vertical,
            ),
          ),
        ]));
  }
}
