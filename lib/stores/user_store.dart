import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase extends ChangeNotifier with Store {

  _UserStoreBase() {
    _loadCurrentUser();
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;

  @observable
  FirebaseUser user;

  @action
  login() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      user = authResult.user;
    } catch (error) {
      print("Erro ao logar com o google: $error");
    }
  }

  _loadCurrentUser() async {
    user = await auth.currentUser();
    if (user != null) notifyListeners();
  }
}
