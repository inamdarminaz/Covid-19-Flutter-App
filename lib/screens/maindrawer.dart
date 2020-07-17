import 'package:covid_tracker/screens/pie.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final Map worldData;

  const MainDrawer({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 10,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'images/help.png',
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PieData(
                                worldData: worldData,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.all(19),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.pie_chart,
                        size: 30,
                      ),
                      Text(
                        '     View Chart',
                        style: TextStyle(
                            fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
