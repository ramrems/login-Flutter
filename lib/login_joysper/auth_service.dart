import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  //FirebaseAuth firebaseAuth=FirebaseAuth.instance;
 // final userCollection= FirebaseFirestore.instance.collection("users");

  Future<User?>login({required String email,required String password,required BuildContext context})async{
    FirebaseAuth firebaseAuth= FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential= await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),backgroundColor: Colors.red,));
    }catch(e){
      print(e);
    }
    return user;
  }
}