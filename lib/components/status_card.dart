import 'package:flutter/material.dart';
import 'package:beer_fridge/components/reusable_card.dart';
import 'package:beer_fridge/constants.dart';

class StatusCard extends StatelessWidget {
  StatusCard({@required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        child: Center(
          child: Text(
            'Last update: $message',
            style: kLabelTextStyle,
          ),
        ),
      ),
    );
  }
}
