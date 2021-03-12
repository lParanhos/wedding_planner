import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:get_it/get_it.dart';
import 'package:weeding_planner/helpers/firebase_helpers.dart';
import 'package:weeding_planner/models/user.dart';
import 'package:weeding_planner/protocol/request_result.dart';
import 'package:weeding_planner/services/firebase.dart';
import 'package:weeding_planner/services/sharedPrefs.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = GetIt.I.get<FirebaseService>().firebaseAuth;
  Future<RequestResult> tryLogin(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _saveUserData(userCredential);

      return requestSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return requestError(404, 'Usuário não encontrado !');
      } else if (e.code == 'wrong-password') {
        return requestError(403, 'Senha inválida !');
      }

      return requestError(500, 'Houve um problema :(');
    }
  }

  Future<RequestResult> tryCreateUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _saveUserData(userCredential);

      return requestSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return requestError(403, 'Senha fraca!');
      } else if (e.code == 'email-already-in-use') {
        return requestError(403, 'E-mail já cadastrado !');
      }
      print("=>>> $e");
      return requestError(500, 'Houve um problema :(');
    }
  }

  _saveUserData(UserCredential userCredential) async {
    final prefs = SharedPrefs();
    final User user = User(
      name: userCredential.user.displayName,
      token: userCredential.user.refreshToken,
      weddingCode: userCredential.user.uid.substring(0, 4),
    );
    await prefs.setUserData(user);
  }
}
