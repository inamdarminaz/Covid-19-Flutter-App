import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.grey[600],
          border: Border.all(
            color: Colors.transparent,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black54,
            )
          ]),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.public,
                  size: 35,
                ),
                SizedBox(width: 10),
                Text(
                  'HIGHEST DEATH RATES',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),

            // color: const Color(0xfffef1e7),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.network(
                        countryData[index]['countryInfo']['flag'],
                        height: 25,
                        width: 35,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        countryData[index]['country'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Deaths:' + countryData[index]['deaths'].toString(),
                        style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light? Colors.red[900] : Colors.red[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
