import 'package:beer_fridge/components/reusable_card.dart';
import 'package:beer_fridge/components/round_icon_button.dart';
import 'package:beer_fridge/components/temp_card.dart';
import 'package:beer_fridge/components/sync_card.dart';
import 'package:beer_fridge/components/status_card.dart';
import 'package:beer_fridge/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beer_fridge/db.dart';
import 'package:beer_fridge/models.dart';

class HomePage extends StatelessWidget {
  HomePage({this.title});

  final String title;
  final _db = DatabaseService();

  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    bool loggedIn = user != null;
    loggedIn ? print("LoggedIn as: ${user.uid}") : print("LoggedOut");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Column(children: <Widget>[
        if (loggedIn) ...[
          StreamBuilder<FridgeStatus>(
            stream: _db.streamStatus(),
            builder: (context, snapshot) {
              final status = snapshot.data;
              final inSync = status.inSync;
              return Expanded(
                child: Row(
                  children: <Widget>[
                    TempCard(
                      currentTemp: status.temp,
                      poweredOn: status.poweredOn,
                    ),
                    SyncCard(inSync: inSync),
                  ],
                ),
              );
            },
          ),
          StreamBuilder<FridgeStatus>(
            stream: _db.streamStatus(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final status = snapshot.data;
                return StatusCard(message: status.message);
              } else {
                return Text('Last update: not available');
              }
            },
          ),
          StreamBuilder<FridgeSettings>(
            stream: _db.streamSettings(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final settings = snapshot.data;
                return Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'MIN TEMP',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                settings.minTemp.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    onPressed: () {},
                                    icon: FontAwesomeIcons.minus,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    onPressed: () {},
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'MAX TEMP',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                settings.maxTemp.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    onPressed: () {},
                                    icon: FontAwesomeIcons.minus,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    onPressed: () {},
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text('Last update: not available');
              }
            },
          ),
        ],
        if (!loggedIn) ...[
          Expanded(
            child: Center(
              child: RaisedButton(
                child: Text('Login'),
                onPressed: FirebaseAuth.instance.signInAnonymously,
              ),
            ),
          )
        ],
      ]),
    );
  }
}
