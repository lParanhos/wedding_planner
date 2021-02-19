import 'package:firebase_auth/firebase_auth.dart';
import 'package:weeding_planner/helpers/firebase_helpers.dart';
import 'package:weeding_planner/protocol/request_result.dart';

class AuthService {
  Future<RequestResult> tryLogin(String email, String password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

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
}
