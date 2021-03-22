import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stnatura/screens/marketing/marketing_screen.dart';
import 'package:stnatura/screens/orders/orders_screen.dart';
import 'package:stnatura/screens/profile/profile_screen.dart';
import 'package:stnatura/screens/stock/stock_screen.dart';
import 'package:stnatura/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: Colors.orange,
                  primaryColor: Colors.orange[700],
                  accentColor: Colors.orange[700],
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  iconTheme: IconThemeData(color: Colors.white),
                  primaryTextTheme:
                      TextTheme(headline6: TextStyle(color: Colors.white))),
              home: MyHomePage(title: ''),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ProfileScreen(),
    StockScreen(),
    MarketingScreen(),
    OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 10 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
            child: GNav(
                gap: 6,
                activeColor: Colors.white,
                color: Colors.brown[900],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.orange[800],
                tabs: [
                  GButton(
                    icon: LineIcons.user,
                    text: 'Meu Espaço',
                  ),
                  GButton(
                    icon: LineIcons.shoppingCart,
                    text: 'Estoque',
                  ),
                  GButton(
                    icon: LineIcons.barChart,
                    text: 'Marketing',
                  ),
                  GButton(
                    icon: LineIcons.shoppingCart,
                    text: 'Pedidos',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
