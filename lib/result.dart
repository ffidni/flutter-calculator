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
    "e": "$e",
    "%": "/100",
  };
  var opr = ["+", "-", "/", "*", "÷", "×", "%", "!", "^", "√", "mod", "EXP"];
  var funcs = ["log(", "cos(", "sin(", "tan(", "sqrt"];
  //bool isFunc = false;

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
    List funcs = ["log", "tan", "sin", "cos", "sqrt"];
    structure.add(value);
    for (String char in structure) {
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

  String createSqrt(List elements, bool isResult) {
    String result = "";
    for (int i = 0; i < elements.length; i++) {
      result += elements[i];
    }
    return isResult ? "√$result" : "sqrt($result)";
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
    String resultKey = "()%.0123456789!^".contains(key) ||
            key.length == 2 ||
            funcs.contains(key)
        ? key
        : " $key ";
    print("$evalKey, $resultKey");
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
      } else if (evalKey == "!" && isNumeric(lastElement)) {
        String factValue = fact(double.parse(lastElement)).toString();
        parent.resultField.add(key);
        parent.evalField[parent.evalField.length - 1] = factValue;
        print(parent.resultField);
      } else if (funcs.contains(key)) {
      } else if (key == "√") {
        int idx = 0;
        for (int i = parent.evalField.length - 1; i >= 0; i--) {
          String evalPrev = parent.evalField[i];
          if (!isNumeric(evalPrev)) {
            print("!isNumeric -> ${!isNumeric(evalPrev)}, $evalPrev");
            break;
          } else {
            idx = i;
          }
        }
        String newResult = createSqrt(
            parent.resultField.sublist(idx, parent.resultField.length), true);
        String newEval = createSqrt(
            parent.evalField.sublist(idx, parent.evalField.length), false);
        parent.resultField = parent.resultField.sublist(0, idx);
        parent.evalField = parent.evalField.sublist(0, idx);
        parent.resultField.add(newResult);
        parent.evalField.add(newEval);
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
          print(parent.resultField);
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
