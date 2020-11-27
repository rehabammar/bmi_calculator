import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.ButtonTitle, @required this.onTap});
  final String ButtonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          ButtonTitle,
          style: KLargeBottomTextStyle,
        )),
        color: KbottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: KbottomContainerHeight,
      ),
    );
  }
}
