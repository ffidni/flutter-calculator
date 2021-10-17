import 'package:flutter/material.dart';
import 'result.dart';

class Keys extends StatefulWidget {
  var parent;
  Keys(this.parent);

  @override
  _KeysState createState() => _KeysState(parent);
}

class _KeysState extends State<Keys> with Result {
  var parent;

  _KeysState(this.parent);

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
                  onPressed: () => addKey("("),
                  child: Text(
                    "(",
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
                  onPressed: () => addKey(")"),
                  child: Text(
                    ")",
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
                  onPressed: clearField,
                  child: Text(
                    "C",
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
                  onPressed: undoKey,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              )
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
                  onPressed: () => addKey("7"),
                  child: Text(
                    "7",
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
                  onPressed: () => addKey("8"),
                  child: Text(
                    "8",
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
                  onPressed: () => addKey("9"),
                  child: Text(
                    "9",
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
                  onPressed: () => addKey("+"),
                  child: Text(
                    "+",
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
                  onPressed: () => addKey("4"),
                  child: Text(
                    "4",
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
                  onPressed: () => addKey("5"),
                  child: Text(
                    "5",
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
                  onPressed: () => addKey("6"),
                  child: Text(
                    "6",
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
                  onPressed: () => addKey("-"),
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
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
                  onPressed: () => addKey("1"),
                  child: Text(
                    "1",
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
                  onPressed: () => addKey("2"),
                  child: Text(
                    "2",
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
                  onPressed: () => addKey("3"),
                  child: Text(
                    "3",
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
                  onPressed: () => addKey("÷"),
                  child: Text(
                    "÷",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: FlatButton(
                  color: Color(0xff676767),
                  onPressed: () => addKey("0"),
                  child: Text(
                    "0",
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
                  onPressed: () => addKey("."),
                  child: Text(
                    ".",
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
                  onPressed: () => addKey("×"),
                  child: Text(
                    "×",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
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
