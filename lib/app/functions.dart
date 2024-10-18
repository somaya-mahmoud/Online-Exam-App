import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(),
);

void logWarning(dynamic text) {
  logger.w(text);
}

void logError(dynamic text) {
  logger.e(text);
}

void logInfo(dynamic text) {
  logger.i(text);
}

void logSuccess(dynamic text) {
  logger.d(text);
}
