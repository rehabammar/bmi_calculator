import 'package:bmicalculator/ReusableWidget.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'ReusableWidget.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiCal, this.getInterpretation, this.getresult});
  final String bmiCal;
  final String getresult;
  final String getInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'BMI CALCULATOR',
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Your Result',
                      style: KTitleTextStyle,
                    ))),
            Expanded(
                flex: 5,
                child: ReusableWidget(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getresult,
                        style: KResultTextStyle,
                      ),
                      Text(
                        bmiCal,
                        style: KBMITextStyle,
                      ),
                      Text(
                        getInterpretation,
                        style: KBodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            BottomButton(
                ButtonTitle: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ));
  }
}
