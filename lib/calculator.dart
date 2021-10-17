import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'keys.dart';
import 'fx.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool _isCurrentNumber = true;
  bool isResult = false;
  List resultField = [];
  List evalField = [];

  void _changeCalcState(bool newCondition) {
    setState(() {
      _isCurrentNumber = newCondition;
    });
  }

  String joinResult(List resultField) {
    String result = "";
    for (String char in resultField) {
      result += char;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff444444),
      body: Column(
        children: <Widget>[
          Expanded(
            key: Key("Result field"),
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(width: 20),
                  Flexible(
                    child: AutoSizeText(
                      resultField.length > 0 ? joinResult(resultField) : "0",
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xffFCFCFC),
                      ),
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff363636),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                IntrinsicHeight(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: FlatButton(
                                  onPressed: () => _changeCalcState(true),
                                  child: Text(
                                    "123",
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: _isCurrentNumber
                                          ? Colors.white
                                          : Color(0xff898989),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        color: Color(0xff676767),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: FlatButton(
                                  onPressed: () => _changeCalcState(false),
                                  child: Text(
                                    "f(x)",
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: _isCurrentNumber
                                          ? Color(0xff898989)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xff363636),
              width: double.infinity,
              height: double.infinity,
              child: _isCurrentNumber ? Keys(this) : Function(this),
            ),
          ),
        ],
      ),
    );
  }
}
