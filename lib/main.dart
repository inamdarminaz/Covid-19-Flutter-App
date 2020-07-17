import 'package:covid_tracker/screens/countrypage.dart';
import 'package:covid_tracker/screens/faq.dart';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'package:covid_tracker/datasource.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
            primaryColor: primaryBlack,
            accentColor: Colors.red[200],
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline6: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
            brightness: brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Color(0xff1a1a24)
                : Colors.white);
      },
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: theme,
          routes: {
            FAQPage.routeName: (ctx) => FAQPage(),
            CountryPage.routeName: (ctx) => CountryPage(),
            //  StatePanel.routeName: (ctx) => StatePanel(),
          },
        );
      },
    );
  }
}
