import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/search.dart';

class CountryPage extends StatefulWidget {
  static const routeName = '/countrypage';
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
      print(json.decode(response.body));
    });
  }

  @override
  void initState() {
    fetchCountryData();
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
        title: Text(
          'COUNTRY STATS',
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              onPressed: () {
                showSearch(context: context, delegate: Search(countryData));
              })
        ],
        iconTheme: IconThemeData(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) => Container(
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
                        color: Colors.transparent,
                      )
                    ]),
                margin: EdgeInsets.all(10),
                height: 150,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            countryData[index]['country'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 50,
                              width: 50)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        margin:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 3),
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
                                color: Colors.black26,
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CONFIRMED: ' +
                                  countryData[index]['cases'].toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'ACTIVE: ' +
                                  countryData[index]['active'].toString(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'RECOVERD: ' +
                                  countryData[index]['recovered'].toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'DEATHS: ' +
                                  countryData[index]['deaths'].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey[100]
                                      : Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'CRITICAL: ' +
                                  countryData[index]['critical'].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.yellow[100]
                                      : Colors.yellow[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'DEATH TODAY: ' +
                                  countryData[index]['todayDeaths'].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.purple[100]
                                      : Colors.purple[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'CASES TODAY: ' +
                                  countryData[index]['todayCases'].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.pinkAccent[100]
                                      : Colors.pinkAccent[400],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
