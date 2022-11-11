import 'dart:async';

class HomeBloc {
  int _menu = 0;
  final StreamController _streamController = StreamController();

  Stream get streamController => _streamController.stream;

  void chooseMenu(int item) {
    _menu = item;
    _streamController.sink.add(_menu);
  }
}
