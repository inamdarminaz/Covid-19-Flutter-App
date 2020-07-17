import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //final suggestionList = query.isEmpty? countryList : countryList.where((element)=> element['country'].toString().toLowerCase().startsWith(query).);
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
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
                    suggestionList[index]['country'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                  Image.network(suggestionList[index]['countryInfo']['flag'],
                      height: 50, width: 50)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
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
                      'CONFIRMED: ' + suggestionList[index]['cases'].toString(),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ACTIVE: ' + suggestionList[index]['active'].toString(),
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'RECOVERD: ' +
                          suggestionList[index]['recovered'].toString(),
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'DEATHS: ' + suggestionList[index]['deaths'].toString(),
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[100]
                              : Colors.grey[900],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'CRITICAL: ' +
                          suggestionList[index]['critical'].toString(),
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.yellow[100]
                              : Colors.yellow[900],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'DEATH TODAY: ' +
                          suggestionList[index]['todayDeaths'].toString(),
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.purple[100]
                              : Colors.purple[900],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'CASES TODAY: ' +
                          suggestionList[index]['todayCases'].toString(),
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
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
      itemCount: suggestionList == null ? 0 : suggestionList.length,
    );
  }
}
