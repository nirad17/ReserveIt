import 'package:firebase_auth/firebase_auth.dart';
import 'package:reservelt/models/user.dart';

class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;  //final -not going to change
  //create user obj based on firebase uSer 'user'
  ThisUser _FromFirebaseUser(User user)
  {
    return user!=null ? ThisUser(uid:user.uid) : null;
  }

  //auth change user stream
  Stream<ThisUser> get user {
    return _auth.authStateChanges()
    //.map(_FromFirebaseUser(user));
    .map((User user)=> _FromFirebaseUser(user));
    //.map(_FromFirebaseUser(user));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result=await _auth.signInAnonymously();
      User user=result.user;
      return _FromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign with email and pw
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user=result.user;
      return _FromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //reg with email and pw
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user=result.user;
      return _FromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }

}