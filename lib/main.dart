import 'package:flutter/material.dart';
import 'appBody.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final myColour = Colors.blueGrey[900];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: myColour,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: AppBody(),
        appBar: AppBar(
          title: Center(
              child: Text(
            "Dummy Interest Calculator",
            style: TextStyle(fontSize: 15.0),
          )),
          leading: IconButton(
            icon: Image.asset("images/diamond.png"),
            onPressed: () {
              debugPrint("APP IMAGE, WAS PRESSED.");
              //ADD DEVELOPER DETAILS TO THE ICON
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.list),
              iconSize: 25.0,
              onPressed: () {
                debugPrint("DUMMY SETTINGS, WAS PRESSED.");
                //CREATE A DUMMY SETTINGS PAGE.
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(
            Icons.add,
          ),
          tooltip: "Save This Plan?",
          onPressed: () {
            debugPrint("ADD TO MEMORY, WAS PRESSED.");
            //A FUNCTION TO ADD THAT PARTICULAR CALCULATION TO MEMORY
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 35.0,
            color: myColour,
          ),
        ),
      ),
    );
  }
}
