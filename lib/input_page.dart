import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableWidget.dart';
import 'CardDesign.dart';
import 'constants.dart';
import 'resultpage.dart';
import 'round_icon_bottum.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}
int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableWidget(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kactiveCardColor
                      : KinactiveCardColor,
                  cardChild: CardDesign(
                      cardIcon: FontAwesomeIcons.mars, cardText: 'MALE'),
                )),
                Expanded(
                    child: ReusableWidget(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kactiveCardColor
                      : KinactiveCardColor,
                  cardChild: CardDesign(
                    cardIcon: FontAwesomeIcons.venus,
                    cardText: 'FEMALE',
                  ),
                ))
              ],
            )),
            Expanded(
                child: ReusableWidget(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: KTextStyleLabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: KTextStyleNumber,
                            ),
                            Text(
                              'cm',
                              style: KTextStyleLabel,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFEB1555),
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        )
                      ],
                    ))),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableWidget(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIHGT',
                        style: KTextStyleLabel,
                      ),
                      Text(
                        weight.toString(),
                        style: KTextStyleNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconBottom(
                            icon: FontAwesomeIcons.plus,
                            action: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconBottom(
                            icon: FontAwesomeIcons.minus,
                            action: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableWidget(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: KTextStyleLabel,
                      ),
                      Text(
                        age.toString(),
                        style: KTextStyleNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconBottom(
                            icon: FontAwesomeIcons.plus,
                            action: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconBottom(
                            icon: FontAwesomeIcons.minus,
                            action: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            )),
            BottomButton(
              ButtonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmiCal: cal.BMICalculator(),
                        getresult: cal.getResult(),
                        getInterpretation: cal.getInterpretation(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ));
  }
}
