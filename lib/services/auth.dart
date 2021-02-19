import 'package:firebase_auth/firebase_auth.dart';
import 'package:weeding_planner/helpers/firebase.dart';

class AuthService {
  Future<RequestResult> tryLogin(String email, String password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return FirebaseHelpers().requestSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return FirebaseHelpers().requestError('Usuário não encontrado !');
      } else if (e.code == 'wrong-password') {
        return FirebaseHelpers().requestError('Senha inválida !');
      }

      return FirebaseHelpers().requestError('Houve um problema :(');
    }
  }
}
