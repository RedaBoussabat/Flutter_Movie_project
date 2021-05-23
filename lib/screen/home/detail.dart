import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/entities/movie.dart';
import 'package:movieapp/services/auth.dart';
import 'package:movieapp/utils/pretty_text.dart';
import 'package:sliver_fab/sliver_fab.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  MovieDetailScreen({Key key, @required this.movie}) : super(key: key);
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(movie);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final Movie movie;
  final AuthService _authService = AuthService();

  _MovieDetailScreenState(this.movie);


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
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    child: Image.network(
                        "https://image.tmdb.org/t/p/original/" +
                            movie.backdropPath
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: RatingBar.builder(
                    itemSize: 30.0,
                    initialRating: movie.rating / 2,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    itemBuilder: (context, _) => Icon(EvaIcons.star,color: Colors.amber),
                  ),
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.all(5),
            child : PrettyText(text: movie.title, color: Colors.white, size: 30,),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.all(5),
                  height: 250,
                  width: 125,
                  child: Image.network(
                      "https://image.tmdb.org/t/p/original/" +
                          movie.posterPath
                  )
              ),
              Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: PrettyText(text: movie.overview, color: Colors.white),
                  )
              )
            ],
          )
        ],
      ),
    );
  }

}