import 'package:flutter/material.dart';
import 'package:beer_fridge/components/reusable_card.dart';
import 'package:beer_fridge/constants.dart';

class TempCard extends StatelessWidget {
  TempCard({@required this.currentTemp, @required this.poweredOn});
  final double currentTemp;
  final bool poweredOn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TEMPERATURE',
              style: kLabelTextStyle,
            ),
            Text(
              ' ${currentTemp.toStringAsFixed(1)}°',
              style: kTempTextStyle.copyWith(
                color: poweredOn ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
