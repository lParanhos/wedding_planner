import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore database;

  FirebaseService._({this.firebaseAuth, this.database});

  factory FirebaseService() => FirebaseService._(
        firebaseAuth: FirebaseAuth.instance,
        database: FirebaseFirestore.instance,
      );
}
