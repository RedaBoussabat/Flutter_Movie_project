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
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white,),
        title: Text("Movie Star"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(EvaIcons.searchOutline, color: Colors.white,)
          ),
          TextButton(
              onPressed: () async {
                await _authService.signOut();
              },
              child: PrettyText(text: 'Log out', color: Colors.white,)
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
