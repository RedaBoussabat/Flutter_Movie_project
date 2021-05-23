import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/screen/widgets/best_movies.dart';
import 'package:movieapp/screen/widgets/now_playing.dart';
import 'package:movieapp/services/auth.dart';
import 'package:movieapp/utils/pretty_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: PrettyText(text :"Movie Star", color: Colors.white,size: 35,),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person, color: Colors.white,),
              label: PrettyText(text: 'Log out', color: Colors.white,),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          BestMovies()
        ],
      ),
    );
  }
}
