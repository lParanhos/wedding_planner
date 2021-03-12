import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:weeding_planner/helpers/firebase_helpers.dart';
import 'package:weeding_planner/models/user.dart';
import 'package:weeding_planner/models/wedding.dart';
import 'package:weeding_planner/protocol/request_result.dart';
import 'package:weeding_planner/services/firebase.dart';
import 'package:weeding_planner/services/sharedPrefs.dart';

class WeddingService {
  FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
  final prefs = SharedPrefs();

  Future<RequestResult> tryCreateWedding({
    String brideName,
    String groomName,
    DateTime weddingDay,
  }) async {
    try {
      CollectionReference weddings =
          _firebaseService.database.collection('weddings');

      User user = await prefs.getUserData();

      Wedding wedding = Wedding(
          groomName: groomName, brideName: brideName, weddingDay: weddingDay);

      await weddings.doc(user.weddingCode).set(wedding.toJSON());

      await _firebaseService.database
          .collection('users')
          .doc(_firebaseService.firebaseAuth.currentUser.uid)
          .set({'weddingCode': user.weddingCode});

      return requestSuccess();
    } catch (e) {
      print('errr => \n\n\n\n\n');
      print(e);
      print('\n\n\n\n\n <= errr');
      return requestError(500, 'Houve um problema :(');
    }
  }

  Future<Wedding> getWedding() async {
    CollectionReference weddings =
        _firebaseService.database.collection('weddings');

    User user = await prefs.getUserData();

    final response = await weddings.doc(user.weddingCode).get();

    return Wedding.fromJson(response);
  }
}
