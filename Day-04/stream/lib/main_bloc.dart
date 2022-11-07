import 'dart:async';

class MainBloc {
  int _count = 0;

  // Broadcast stream -> to multi widget/screen can listen this stream.
  //StreamController.broadcast()
  final StreamController _streamController = StreamController<int>.broadcast();
  Stream get streamController =>
      _streamController.stream.transform(_streamTransform);

  //Stream transform to trasform or modify
  final _streamTransform = StreamTransformer<int, int>.fromHandlers(
    handleData: (data, sink) {
      data += 10;
      sink.add(data);
    },
  );

  void disposed() {
    _streamController.close();
  }

  void increment() {
    _count += 1;
    _streamController.sink.add(_count);
  }
}
