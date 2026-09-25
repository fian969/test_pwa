import 'package:logger/logger.dart';
import 'dart:developer' as developer;

var logger = Logger(
  printer: PrettyPrinter(methodCount: 0, errorMethodCount: 30),
  output: MyConsoleOutput(),
);

class MyConsoleOutput extends ConsoleOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(developer.log);
  }
}
