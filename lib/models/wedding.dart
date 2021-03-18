import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Wedding {
  String id;
  String groomName;
  String brideName;
  DateTime weddingDay;

  Wedding({this.id, this.groomName, this.brideName, this.weddingDay});

  factory Wedding.fromJson(DocumentSnapshot doc) => Wedding(
        id: doc.id,
        groomName: doc.data()['groomName'],
        brideName: doc.data()['brideName'],
        weddingDay: doc.data()['weddingDay'].toDate(),
      );

  Map<String, dynamic> toJSON() => {
        'groomName': this.groomName,
        'brideName': this.brideName,
        'weddingDay': this.weddingDay,
      };

  String get formatedDate => DateFormat('dd/MM/yyyy').format(weddingDay);
}
