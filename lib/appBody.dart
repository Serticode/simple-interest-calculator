import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayers();
  }
}

class AppLayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestingStateType();
  }
}

class TestingStateType extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestingStateTypeState();
  }
}

class TestingStateTypeState extends State<TestingStateType> {
  final margin = EdgeInsets.all(10.0);
  final myColour = Colors.blueGrey[900];
  var _curriencies = ["Naira", "Pound Sterling", "Dollars"];
  var _currentlySelectedItem = '';

  @override
  void initState() {
    super.initState();
    _currentlySelectedItem = _curriencies[0];
  }

  var _textStyle = TextStyle(fontWeight: FontWeight.w500);
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  var displayResult = '';
  var displayInterest = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(10.0),
              child: Text(
                this.displayInterest,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              this.displayResult,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Divider(
            indent: 70.0,
            endIndent: 70.0,
            thickness: 1.5,
            color: Colors.deepOrange,
          ),
          Padding(
            padding: margin,
            child: TextField(
              style: _textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Invested Sum: ",
                hintText: "Enter Principal Amount E.G 12000",
                border: UnderlineInputBorder(),
              ),
              controller: principalController,
            ),
          ),
          Padding(
            padding: margin,
            child: TextField(
              style: _textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Rate: ",
                hintText: "Enter Given Rate E.G 10%",
                border: UnderlineInputBorder(),
              ),
              controller: rateController,
            ),
          ),
          Padding(
            padding: margin,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    style: _textStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Time ",
                      hintText: "Enter investment Time Span",
                      border: UnderlineInputBorder(),
                    ),
                    controller: timeController,
                  ),
                ),
                Container(
                  width: 30.0,
                ),
                Expanded(
                  child: DropdownButton<String>(
                      items: _curriencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentlySelectedItem,
                      onChanged: (String newValueSelected) {
                        _onDropDownSelected(newValueSelected);
                        //CODE IN HERE
                      }),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text(
                    "RESET",
                    style: TextStyle(color: Colors.white70, fontSize: 15.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                    debugPrint("RESET, WAS PRESSED.");
                  },
                  color: this.myColour,
                  splashColor: Colors.white70,
                  elevation: 5.0,
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  onPressed: () {
                    setState(() {
                      this.displayResult = _calculateTotalReturns();
                      this.displayInterest = _calculateInterest();
                    });
                    debugPrint("CALCULATE, WAS PRESSED.");
                  },
                  color: Colors.deepOrange,
                  splashColor: this.myColour,
                  elevation: 5.0,
                ), //THIS IS FOR THE VALUE OF THE PRINCIPAL.
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onDropDownSelected(String newValueSelected) {
    setState(() {
      this._currentlySelectedItem = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double time = double.parse(timeController.text);

    double interest = (principal * rate * time) / 100;
    double totalReturns = principal + interest;
    String result =
        "After $time Years, your investment will be worth $totalReturns $_currentlySelectedItem, with $interest $_currentlySelectedItem as Your Interest.";
    return result;
  }

  String _calculateInterest() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double time = double.parse(timeController.text);

    double interest = (principal * rate * time) / 100;
    return interest.toString();
  }

  void _reset() {
    principalController.text = '';
    rateController.text = '';
    timeController.text = '';
    displayInterest = '';
    displayResult = '';
    _currentlySelectedItem = _curriencies[0];
  }
}
