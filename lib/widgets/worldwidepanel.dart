import '../screens/countrypage.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black54,
                )
              ]),
          child: ClipRRect(
            child: Image.asset(
              'images/redbg.jpg',
              fit: BoxFit.cover,
              height: 300,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.nature_people,
                          size: 35,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'GLOBAL STATS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 125,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Colors.white,
                          )),
                      elevation: 10,
                      onPressed: () {
                        Navigator.of(context).pushNamed(CountryPage.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.assignment,
                            color: Colors.black,
                          ),
                          SizedBox(width: 2),
                          Text(
                            'COUNTRY',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2),
                children: <Widget>[
                  StatusPanel(
                      panelColor: Colors.grey[300].withOpacity(0.99),
                      textColor: Colors.red[900],
                      title: 'CONFIRMED',
                      count: worldData['cases'].toString()),
                  StatusPanel(
                      panelColor: Colors.grey[300].withOpacity(0.99),
                      textColor: Colors.blue[900],
                      title: 'ACTIVE',
                      count: worldData['active'].toString()),
                  StatusPanel(
                      panelColor: Colors.grey[300].withOpacity(0.99),
                      textColor: Colors.green,
                      title: 'RECOVERED',
                      count: worldData['recovered'].toString()),
                  StatusPanel(
                      panelColor: Colors.grey[300].withOpacity(0.99),
                      textColor: Colors.black,
                      title: 'DEATHS',
                      count: worldData['deaths'].toString()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: width / 2,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: panelColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'Raleway')),
          Text(count,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
        ],
      ),
    );
  }
}
