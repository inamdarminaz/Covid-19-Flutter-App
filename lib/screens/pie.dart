import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieData extends StatelessWidget {
  final Map worldData;

  const PieData({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Color(0xff1a1a24),
          elevation: 0.0,
          title: Text(
            'RING CHART',
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
        ),
        body: Container(
          height: 300,
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Color(0xfffbe7f2),
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black45,
                )
              ]),
          margin: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.pie_chart,
                    size: 35,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'GRAPHICAL REPRESENTATION',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 19,),
              PieChart(
                dataMap: {
                  'Confirmed': worldData['cases'].toDouble(),
                  'Active': worldData['active'].toDouble(),
                  'Recovered': worldData['recovered'].toDouble(),
                  'Deaths': worldData['deaths'].toDouble(),
                },
                // chartType: ChartType.ring,
                //  showChartValuesOutside: true,
                colorList: [
                  Colors.red[300],
                  Colors.blue[300],
                  Colors.green[300],
                  Colors.grey[400],
                ],
                animationDuration: Duration(milliseconds: 1000),
                chartLegendSpacing: 32.0,
              ),
            ],
          ),
        ));
  }
}
