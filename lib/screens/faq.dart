import '../datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  static const routeName = '/faq';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'FAQs',
          style: TextStyle(color: Theme.of(context).brightness == Brightness.light? Colors.black : Colors.white,fontFamily: 'Raleway',fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Colors.white,
        backgroundColor: Theme.of(context).brightness == Brightness.light? Colors.white : Color(0xff1a1a24),
        elevation: 0.0,
         iconTheme:  IconThemeData(color:
          Theme.of(context).brightness == Brightness.light?
                     
           Colors.black: Colors.white),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ExpansionTile(
          title: Text(
            DataSource.questionAnswers[index]['question'],
            style: TextStyle(color: Theme.of(context).brightness == Brightness.light? Colors.black : Colors.white,fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                DataSource.questionAnswers[index]['answer'],
                style: TextStyle(color: Theme.of(context).brightness == Brightness.light? Colors.black : Colors.grey[300],),
              ),
            ),
          ],
        ),
        itemCount: DataSource.questionAnswers.length,
      ),
    );
  }
}
