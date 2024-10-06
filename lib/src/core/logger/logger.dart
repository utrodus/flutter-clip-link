import 'package:loggy/loggy.dart' as loggy;
import 'package:loggy/loggy.dart';

typedef LoggerFunction = void Function(
  String message, [
  dynamic error,
  StackTrace? stackTrace,
]);

final LoggerFunction logDebug = loggy.logDebug;
final LoggerFunction logInfo = loggy.logInfo;
final LoggerFunction logWarning = loggy.logWarning;
final LoggerFunction logError = loggy.logError;

void initLoggy() {
  Loggy.initLoggy(
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.warning,
    ),
    logPrinter: const PrettyPrinter(),
  );
}
