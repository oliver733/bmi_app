import 'package:bmi/colors.dart';
import 'package:bmi/ui/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Gender { male, female }

class _MyHomePageState extends State<MyHomePage> {
  Gender _selectedGender = Gender.male;
  int _selectedWeight = 50;
  int _selectedHeight = 160;

  void _goToResult() {
    double result =
        (_selectedWeight / ((_selectedHeight / 100) * (_selectedHeight / 100)))
            .floorToDouble();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          result: result,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _gender(),
                  _weight(),
                  _height(),
                ],
              ),
            ),
            _calculateButton()
          ],
        ));
  }

  Widget _calculateButton() {
    return Container(
      padding: EdgeInsets.all(40),
      width: (MediaQuery.of(context).size.width / 100) * 90,
      child: RaisedButton(
        elevation: 0,
        onPressed: () {
          _goToResult();
        },
        color: MyColors.green,
        child: Text(
          "Calculate",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget genderButton(Gender gender) {
    return Container(
        padding: EdgeInsets.all(10),
        width: 150,
        child: _selectedGender == gender
            ? RaisedButton(
                elevation: 0,
                color: MyColors.green,
                child: Icon(
                  gender == Gender.male
                      ? FontAwesomeIcons.male
                      : FontAwesomeIcons.female,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _selectedGender = gender;
                  });
                },
              )
            : OutlineButton(
                highlightElevation: 0,
                borderSide: BorderSide(width: 3, color: MyColors.grey),
                color: MyColors.grey,
                child: Icon(
                  gender == Gender.male
                      ? FontAwesomeIcons.male
                      : FontAwesomeIcons.female,
                  size: 30,
                  color: MyColors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedGender = gender;
                  });
                },
              ));
  }

  Widget _gender() {
    return Column(
      children: <Widget>[
        Text(
          "Gender",
          style: TextStyle(
            fontSize: 20,
            color: MyColors.grey,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            genderButton(Gender.male),
            genderButton(Gender.female)
          ],
        )
      ],
    );
  }

  Widget _weight() {
    return Column(
      children: <Widget>[
        Text(
          "Weight",
          style: TextStyle(
            fontSize: 20,
            color: MyColors.grey,
          ),
        ),
        Slider(
          activeColor: MyColors.green,
          min: 0,
          max: 200,
          value: _selectedWeight.toDouble(),
          onChanged: (change) {
            setState(() {
              _selectedWeight = change.round();
            });
          },
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: _selectedWeight.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 34, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' kg',
                  style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey))
            ],
          ),
        ),
      ],
    );
  }

  Widget _height() {
    return Column(
      children: <Widget>[
        Text(
          "Height",
          style: TextStyle(
            fontSize: 20,
            color: MyColors.grey,
          ),
        ),
        Slider(
          activeColor: MyColors.green,
          min: 0,
          max: 280,
          value: _selectedHeight.toDouble(),
          onChanged: (change) {
            setState(() {
              _selectedHeight = change.round();
            });
          },
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: _selectedHeight.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 34, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' cm',
                  style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: MyColors.grey))
            ],
          ),
        ),
      ],
    );
  }
}
