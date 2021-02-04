import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:undemy_cours/screens/widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

final _auth = FirebaseAuth.instance;
var _isLoding = false ;

  void _submitAuthForm(
      String email,
      String password,
      String userName,
      BuildContext ctx,
       bool isLogin ) async {

        AuthResult authResult ;
        try {

          setState(() {
          _isLoding = true ;
        });

      if (isLogin){
       authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      } else{
      authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await Firestore.instance.collection('users').document(authResult.user.uid).setData({
        'username': userName,
        'email': email,
      
       });
      }
      } on PlatformException catch(err){ 
        var message = 'n error occurred , please check your crediantials';

        if (err.message != null ){
          message = err.message;
        }

        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(ctx).errorColor,
          ),
        );

        setState(() {
          _isLoding = false ;
        });

      } catch (err){
        print(err);
        setState(() {
          _isLoding = false ;
        });
      }

      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        _submitAuthForm,
        _isLoding,
        ),
    );
  }
}
