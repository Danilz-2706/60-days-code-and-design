import 'dart:isolate';

class RequiredArgs {
  final SendPort sendPort;
  final Map data;

  RequiredArgs(this.sendPort, this.data);
}
