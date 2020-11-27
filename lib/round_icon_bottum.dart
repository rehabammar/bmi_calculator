import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconBottom extends StatelessWidget {
  RoundIconBottom({this.icon, this.action});
  final IconData icon;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: action,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
