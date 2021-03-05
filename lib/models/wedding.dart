import 'package:cloud_firestore/cloud_firestore.dart';

class Wedding {
  String id;
  String groomName;
  String brideName;
  DateTime weddingDay;

  Wedding({this.id, this.groomName, this.brideName, this.weddingDay});

  factory Wedding.fromJson(DocumentSnapshot doc) => Wedding(
        id: doc.id,
        groomName: doc['groomName'],
        brideName: doc['brideName'],
        weddingDay: doc['weddingDay'],
      );

  Map<String, dynamic> toJSON() => {
        'groomName': this.groomName,
        'brideName': this.brideName,
        'weddingDay': this.weddingDay,
      };
}
