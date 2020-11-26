import 'package:flutter/material.dart';
import 'package:mobileapp/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            color: Colors.orange[800],
            height: 40 * SizeConfig.heightMultiplier,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 10 * SizeConfig.heightMultiplier),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 11 * SizeConfig.heightMultiplier,
                        width: 22 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/profileimg.jpg"))),
                      ),
                      SizedBox(
                        width: 5 * SizeConfig.widthMultiplier,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Aline Pilot",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1 * SizeConfig.heightMultiplier,
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/fb.png",
                                    height: 3 * SizeConfig.heightMultiplier,
                                    width: 3 * SizeConfig.widthMultiplier,
                                  ),
                                  SizedBox(
                                    width: 2 * SizeConfig.widthMultiplier,
                                  ),
                                  Text(
                                    "alinepilot",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 1.5 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 7 * SizeConfig.widthMultiplier,
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/insta.png",
                                    height: 3 * SizeConfig.heightMultiplier,
                                    width: 3 * SizeConfig.widthMultiplier,
                                  ),
                                  SizedBox(
                                    width: 2 * SizeConfig.widthMultiplier,
                                  ),
                                  Text(
                                    "@aline_pilot",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 1.5 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3 * SizeConfig.heightMultiplier,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "72",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "NPS",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 1.9 * SizeConfig.textMultiplier,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "42",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Estoque",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 1.9 * SizeConfig.textMultiplier,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "25",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Vendas",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 1.9 * SizeConfig.textMultiplier,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 35 * SizeConfig.heightMultiplier),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      )),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: 2 * SizeConfig.heightMultiplier),
                          child: RaisedButton(
                            color: Colors.orange[600],
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () {},
                            child: Text("Compartilhar Meu Espaço"),
                          )),
                      SizedBox(
                        height: 3 * SizeConfig.heightMultiplier,
                      ),
                    ],
                  ))))
        ],
      ),
    );
  }
}
