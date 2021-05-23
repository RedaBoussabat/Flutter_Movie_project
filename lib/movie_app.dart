import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/screen/wrapper.dart';
import 'package:movieapp/services/auth.dart';
import 'package:provider/provider.dart' as stream;


import 'entities/user.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return stream.StreamProvider<User>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Application',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Wrapper(),
      ),
    );
  }
}