import 'package:bmi/colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double result;

  ResultPage({@required this.result});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String classifcationText;
    if (widget.result < 18.5) {
      classifcationText = "Underweight";
    } else if (widget.result < 25) {
      classifcationText = "Normal";
    } else {
      classifcationText = "Overweight";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Result"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.result.toString(),
                    style:
                        TextStyle(fontSize: 120, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    classifcationText,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyColors.grey),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/background.png'),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
