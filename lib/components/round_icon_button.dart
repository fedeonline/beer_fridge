import 'package:flutter/material.dart';
import 'package:beer_fridge/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.onPressed, @required this.icon});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 48.0,
        width: 48.0,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: kRoundButtonColor,
    );
  }
}
