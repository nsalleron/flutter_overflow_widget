import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:'Roboto',
      ),
      home: OverFlowWidget(),
    );
  }
}
class OverFlowWidget extends StatelessWidget {
  const OverFlowWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("simple overflow on large text", style: TextStyle(fontFamily: 'Roboto')),
      ),
      body: Container(
        child: Card(
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite,
                size: 24,
                color: Colors.pink),
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                    text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  children: <TextSpan> [
                    TextSpan(text: 'This is a simple card with an '),
                    TextSpan(text: 'important message !', style:TextStyle(fontWeight: FontWeight.bold)),
                  ]
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.beach_access,
                  color: Colors.blue,
                  size: 24.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}