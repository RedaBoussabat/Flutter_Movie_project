import 'package:movieapp/entities/movie_response.dart';
import 'package:movieapp/repository/respository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
  BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;

}
final moviesBloc = MoviesListBloc();