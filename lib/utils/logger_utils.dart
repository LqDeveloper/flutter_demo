import 'package:logger/logger.dart';

class LoggerUtil {
  static LoggerUtil _instance = LoggerUtil._internal();

  late Logger _logger;

  LoggerUtil._internal() {
    _logger = Logger(
      printer: PrettyPrinter(),
    );
  }

  factory LoggerUtil() {
    return _instance;
  }

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.v(message, error, stackTrace);
  }

  static void close() {
    _instance._logger.close();
  }

  static void log(Level level, dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.log(level, message, error, stackTrace);
  }

  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.wtf(message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.e(message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.w(message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.i(message, error, stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _instance._logger.d(message, error, stackTrace);
  }
}
