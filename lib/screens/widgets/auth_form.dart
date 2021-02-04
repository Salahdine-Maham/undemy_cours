import 'package:flutter/material.dart';

class AuthForm  extends StatefulWidget {
  AuthForm(this.submitFn,this.isLoading);

  final bool isLoading;
  final void Function(
     String email,
      String password,
      String userName,
      BuildContext ctx,
      bool isLogin ) submitFn ;
  @override
  _AuthFormState createState() => _AuthFormState();

}

class _AuthFormState extends State<AuthForm> {

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail ='';
  var _userName ='';
  var _userPassword ='';

  void _trySubmit(){

    final isValide =_formKey.currentState.validate();
    FocusScope.of(context).unfocus();
   

       if(isValide){
         _formKey.currentState.save();
         widget.submitFn(
             _userEmail,
             _userPassword,
             _userName,
             context,
             _isLogin
                    );

    print(_userEmail);
    print(_userName);
    print(_userPassword);
         
         // use those values to send our auth request ...
    } 
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Padding(padding: EdgeInsets.all(16),
             child: Form(
             key: _formKey,
             child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              TextFormField(
                key: ValueKey('Email'),

              // validation of the user email 
                 validator: (value){
                if(!value.contains("@") || value.isEmpty){
                  return 'Please enter a valide email';
                }else {
                  return null;
                }
                
              },
              keyboardType:  TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email address'
              ),

              onSaved: (value){
                _userEmail = value;
              },
            ),
            if (!_isLogin)
            TextFormField( 
              key: ValueKey('Username'),
              // validation for the username
              validator: (value){
                if(value.isEmpty || value.length<4){
                  return 'please a valide user name';
                }
                else {
                  return null;
                }
                
              },
              decoration: InputDecoration(labelText: 'Username'),
              onSaved: (value){
                _userName = value;
              },
            ),
            TextFormField(
              key: ValueKey('Password'),
              // validation for the password
              validator: (value){
                if (value.isEmpty || value.length<6){
                  return 'please a valide password';
                }
               else {
                  return null;
                }
                
              },
              decoration: InputDecoration(labelText : 'Password'),
              obscureText: true,
              onSaved: (value){
                _userPassword = value;
              },
            ),
            SizedBox(height: 12,),
            if(widget.isLoading) CircularProgressIndicator(),

            if(!widget.isLoading)
            RaisedButton(
              child: Text(_isLogin ? 'Login' : 'Signp'), 
            onPressed: _trySubmit ,
            ),

            if(!widget.isLoading)
            FlatButton(
              child: Text(_isLogin ? 'create new account' : 'I  alredy have an account '),

             onPressed: () {
               setState(() {
                 _isLogin = !_isLogin;
               });
             } ,
             
             ),
             
          ],
        )),
        ),
        ),
        )
        );
  }
}