import 'package:flutter/material.dart';
import 'package:beer_fridge/components/reusable_card.dart';
import 'package:beer_fridge/constants.dart';

class SyncCard extends StatelessWidget {
  SyncCard({@required this.inSync});
  final bool inSync;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SYNC',
              style: kLabelTextStyle,
            ),
            Text(
              inSync ? 'ON' : 'OFF',
              style: kTempTextStyle.copyWith(
                color: inSync ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
