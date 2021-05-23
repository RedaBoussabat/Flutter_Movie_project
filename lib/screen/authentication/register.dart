import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/services/auth.dart';
import 'package:movieapp/utils/pretty_text.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({Key key, this.toggleView}) : super(key: key);


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error ='';

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: PrettyText(text: 'Sign In', color: Colors.white,),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: PrettyText(text: 'Join Movie Star',size: 30,color: Colors.white,),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 60.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                        hintText: 'Email',
                        prefixIcon: Icon(EvaIcons.email),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true,
                        hintText: 'Password',
                        prefixIcon: Icon(EvaIcons.lock),
                      ),
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                        child: PrettyText( text :'Register', color: Colors.white,),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[400],
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth.registerWithEmailAndPassword(
                                email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email';
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

          ],
        ),
      ),
    );

  }
}
