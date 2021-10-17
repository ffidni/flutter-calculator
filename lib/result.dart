import 'dart:math';
import 'package:function_tree/function_tree.dart';

mixin Result {
  var parent;
  Map evalChar = {
    "÷": "/",
    "×": "*",
    ".": ".",
    "π": "pi",
    "mod": "%",
    "log": "log()",
    "sin": "sin()",
    "cos": "cos()",
    "tan": "tan()",
    "e": "$e",
    "%": "/100",
  };
  var opr = ["+", "-", "/", "*", "÷", "×", "%", "!", "^", "√", "mod", "EXP"];

  double fact(double n) {
    if (n == 1 || n == 0) {
      return n;
    } else {
      return n * fact(n - 1);
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  String joinResult(List resultField) {
    String result = "";
    for (String char in resultField) {
      result += char;
    }
    return result;
  }

  void seperateField() {
    List resultField = [];
    List evalField = [];
    for (String eval in parent.resultField) {
      eval.runes.forEach((int idx) {
        var char = new String.fromCharCode(idx);
        resultField.add(char);
      });
    }
    for (String eval in parent.evalField) {
      eval.runes.forEach((int idx) {
        var char = new String.fromCharCode(idx);
        evalField.add(char);
      });
    }
    changeParentState(resultField, evalField);
  }

  void changeParentState(List resultField, List evalField) {
    parent.setState(() {
      parent.resultField = resultField;
      parent.evalField = evalField;
    });
  }

  void undoKey() {
    if (parent.resultField.length > 1) {
      parent.setState(() {
        if (parent.resultField[parent.resultField.length - 1] == "!") {
          parent.resultField.removeLast();
          parent.resultField.removeLast();
          parent.evalField.removeLast();
        } else {
          parent.resultField.removeLast();
          parent.evalField.removeLast();
        }
      });
    } else {
      clearField();
    }
  }

  void clearField() {
    parent.setState(() {
      parent.resultField = ["0"];
      parent.evalField = ["0"];
    });
  }

  void doMath() {
    var result;
    try {
      print(parent.evalField);
      result = joinResult(parent.evalField).interpret().toString();
      print(result);
    } catch (_) {
      result = "Error";
    }
    parent.setState(() {
      parent.resultField = [result];
      parent.evalField = [result];
    });
    parent.isResult = true;
  }

  String updateFunc(String func, String value) {
    String result = "";
    int parenthesess = 0;
    List structure = func.replaceAll("(", " ").replaceAll(")", " ").split(" ");
    structure.add(value);
    for (String char in structure) {
      List funcs = ["log", "tan", "sin", "cos", "sqrt"];
      if (funcs.contains(char)) {
        result += "$char(";
        parenthesess++;
      } else {
        result += char;
      }
    }
    for (int _ = 0; _ < parenthesess; _++) {
      result += ")";
    }
    return result;
  }

  void _clearIfResult(String key) {
    if (parent.isResult) {
      if (!opr.contains(key)) {
        clearField();
      }
      parent.isResult = false;
    }
  }

  List addKey(String key) {
    _clearIfResult(key);

    if (parent.resultField.length == 1 &&
        parent.resultField[0] == "0" &&
        !opr.contains(key)) {
      parent.resultField = [];
      parent.evalField = [];
    }
    String evalKey = evalChar.containsKey(key) ? evalChar[key] : key;
    String resultKey =
        "()%.0123456789!^".contains(key) || key.length == 2 ? key : " $key ";
    var lastElement = parent.evalField.length > 0
        ? parent.evalField[parent.evalField.length - 1]
        : null;

    if (lastElement == null) {
      if (key != "E") {
        parent.resultField.add(resultKey);
        parent.evalField.add(evalKey);
      }
    } else {
      if (["Error", "Infinity"].contains(parent.resultField[0])) {
        clearField();
      }
      if (lastElement.length > 3 &&
          ["cos", "sin", "tan", "log"].contains(lastElement.substring(0, 3))) {
        if (key == ")") {
          int left = "(".allMatches(lastElement).length;
          int right = ")".allMatches(lastElement).length;
          if (left == right) {
            parent.resultField.add(resultKey);
            parent.evalField.add(evalKey);
          } else {
            parent.evalField[parent.evalField.length - 1] =
                updateFunc(lastElement, evalKey);
            parent.resultField[parent.evalField.length - 1] = updateFunc(
                parent.resultField[parent.evalField.length - 1], resultKey);
          }
        } else {
          parent.evalField[parent.evalField.length - 1] =
              updateFunc(lastElement, evalKey);
          parent.resultField[parent.evalField.length - 1] = updateFunc(
              parent.resultField[parent.evalField.length - 1], resultKey);
        }
      } else if (evalKey == "!" && isNumeric(lastElement)) {
        String factValue = fact(double.parse(lastElement)).toString();
        parent.resultField.add(resultKey);
        parent.evalField[parent.evalField.length - 1] = factValue;
      } else if (key == "√") {
        parent.resultField[parent.resultField.length - 1] =
            "√${parent.resultField[parent.resultField.length - 1]}";
        parent.evalField[parent.evalField.length - 1] =
            "sqrt(${parent.evalField[parent.evalField.length - 1]})";
      } else {
        if ("πe!".contains(parent.resultField[parent.resultField.length - 1]
                .replaceAll(" ", "")) &&
            !opr.contains(evalKey)) {
          parent.resultField.add(" × ");
          parent.resultField.add(resultKey);
          parent.evalField.add("*");
          parent.evalField.add(evalKey);
        } else if (parent.resultField[parent.resultField.length - 1]
            .contains("√")) {
          parent.resultField[parent.resultField.length - 1] =
              parent.resultField[parent.resultField.length - 1] + resultKey;
          parent.evalField[parent.evalField.length - 1] = updateFunc(
              parent.evalField[parent.evalField.length - 1], evalKey);
        } else {
          parent.resultField.add(resultKey);
          parent.evalField.add(evalKey);
        }
      }
    }

    changeParentState(parent.resultField, parent.evalField);
  }
}
