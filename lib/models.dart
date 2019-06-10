import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';

class FridgeStatus {
  final int updatedAt;
  final double temp;
  final bool poweredOn;
  final bool inSync;
  final String message;

  FridgeStatus(
      {this.updatedAt, this.temp, this.poweredOn, this.inSync, this.message});

  factory FridgeStatus.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    int updatedAt = data['updatedAt'].millisecondsSinceEpoch ??
        DateTime.utc(1970).millisecondsSinceEpoch;
    final DateTime myDate = DateTime.fromMillisecondsSinceEpoch(updatedAt);

    return FridgeStatus(
      updatedAt: updatedAt,
      temp: data['celsius'] ?? 0.0,
      poweredOn: data['poweredOn'],
      inSync: DateTime.now().millisecondsSinceEpoch - updatedAt < 600000,
      message: formatDate(
        myDate,
        [
          dd,
          '-',
          mm,
          '-',
          yyyy,
          ' ',
          HH,
          ':',
          nn,
          ':',
          ss,
        ],
      ),
    );
  }
}

class FridgeSettings {
  final double minTemp;
  final double maxTemp;

  FridgeSettings({this.minTemp, this.maxTemp});

  factory FridgeSettings.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return FridgeSettings(
      minTemp: data['minTemp'] ?? 0.0,
      maxTemp: data['maxTemp'] ?? 0.0,
    );
  }
}
