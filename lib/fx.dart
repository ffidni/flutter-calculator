import 'package:flutter/material.dart';
import 'result.dart';

class Function extends StatefulWidget {
  var parent;
  Function(this.parent);

  @override
  _FunctionState createState() => _FunctionState(parent);
}

class _FunctionState extends State<Function> with Result {
  var parent;

  _FunctionState(this.parent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("π"),
                  child: Text(
                    "π",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("^"),
                  child: Text(
                    "x^y",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("!"),
                  child: Text(
                    "x!",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("√"),
                  child: Text(
                    "√",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("cos("),
                  child: Text(
                    "cos",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("sin("),
                  child: Text(
                    "sin",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("tan("),
                  child: Text(
                    "tan",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("log("),
                  child: Text(
                    "log",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("e"),
                  child: Text(
                    "e",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("%"),
                  child: Text(
                    "%",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("E"),
                  child: Text(
                    "EXP",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("mod"),
                  child: Text(
                    "mod",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: doMath,
                  child: Text(
                    "=",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
