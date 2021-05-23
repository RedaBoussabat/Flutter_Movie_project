import 'package:flutter/material.dart';
import 'package:movieapp/services/auth.dart';
import 'package:movieapp/utils/pretty_text.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  const SignIn({Key key, this.toggleView}) : super(key: key);


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error ='';

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        elevation: 0.0,
        title: PrettyText(text: 'Sign in to Movie Star'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: PrettyText(text:'Register', color: Colors.white,),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    child: PrettyText( text :'Sign In', color: Colors.white,),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            error = 'Could not sign in with those credentials';
                          });
                        }
                      }
                    }
                ),
                SizedBox(height: 12.0,),
                PrettyText(
                  text: error,
                  color: Colors.red,
                  size: 15.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}