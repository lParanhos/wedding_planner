import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:weeding_planner/helpers/firebase_helpers.dart';
import 'package:weeding_planner/models/user.dart';
import 'package:weeding_planner/protocol/request_result.dart';
import 'package:weeding_planner/services/firebase.dart';
import 'package:weeding_planner/services/sharedPrefs.dart';

class WeedingService {
  FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();

  Future<RequestResult> tryCreateWedding({
    String brideName,
    String groomName,
    DateTime weedingDay,
  }) async {
    try {
      CollectionReference weddings =
          _firebaseService.database.collection('weddings');

      final prefs = SharedPrefs();

      User user = await prefs.getUserData();
      print("token => ${user.weddingCode}");
      await weddings.doc(user.weddingCode).set({
        'groomName': groomName,
        'brideName': brideName,
        'weedingDay': weedingDay,
      });

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
}
