import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'models.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  Stream<FridgeStatus> streamStatus() {
    return _db
        .collection('fridge')
        .document('status')
        .snapshots()
        .map((doc) => FridgeStatus.fromFirestore(doc));
  }

  Stream<FridgeSettings> streamSettings() {
    return _db
        .collection('fridge')
        .document('settings')
        .snapshots()
        .map((doc) => FridgeSettings.fromFirestore(doc));
  }
}
