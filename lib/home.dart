import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './widgets/infopanel.dart';
import './widgets/mostaffectedcountries.dart';
import './widgets/worldwidepanel.dart';
import './screens/maindrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
      //print(json.decode(response.body));
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
     // print(json.decode(response.body));
    });
  }

  List stateData;

  fetchStateData() async {
    http.Response response = await http
        .get('https://api.covid19india.org/v2/state_district_wise.json');
    setState(() {
      stateData = json.decode(response.body);
      //  print(json.decode(response.body));
    });
  }

  Future<void> fetchAndSet() async {
    fetchWorldWideData();
    fetchCountryData();
    fetchStateData();
    print('Refreshed API');
  }

  @override
  void initState() {
    fetchAndSet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color(0xff1a1a24),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Theme.of(context).brightness == Brightness.light
                    ? Icons.lightbulb_outline
                    : Icons.highlight,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              onPressed: () {
                DynamicTheme.of(context).setBrightness(
                    Theme.of(context).brightness == Brightness.light
                        ? Brightness.dark
                        : Brightness.light);
              })
        ],
        centerTitle: false,
        title: Text(
          'COVID-19 TRACKER',
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
      drawer: MainDrawer(worldData: worldData,),
      body: RefreshIndicator(
        onRefresh: fetchAndSet,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                worldData == null
                    ? CircularProgressIndicator()
                    : WorldWidePanel(
                        worldData: worldData,
                      ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/read.png',
                        height: 230,
                        width: 400,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      color: Color(0xfffbe7f2),
                      height: 120,
                      width: 400,
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '\"Our highest calling in life is to thrive and flourish, and not just survive. During this incredibly challenging time, we must do our best to thrive.\"',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xfff36b7f),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                countryData == null
                    ? Container()
                    : MostAffectedPanel(
                        countryData: countryData,
                      ),
                SizedBox(
                  height: 10,
                ),
                InfoPanel(),
                SizedBox(
                  height: 50,
                ),

                //delete
                // PieChart(
                //   dataMap: {
                //     'Confirmed': worldData['cases'].toDouble(),
                //     'Active': worldData['active'].toDouble(),
                //     'Recovered': worldData['recovered'].toDouble(),
                //     'Deaths': worldData['deaths'].toDouble(),
                //   },
                //   chartType: ChartType.ring,
                //   showChartValuesOutside: true,
                //   colorList: [
                //     Colors.red,
                //     Colors.blue,
                //     Colors.green,
                //     Colors.grey[200],
                //   ],
                //   animationDuration: Duration(milliseconds: 800),
                //   chartLegendSpacing: 32.0,

                // ),

                //delete
              ],
            ),
          ),
        ),
      ),
    );
  }
}
