import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/models/order.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Ola Mundo'),
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
