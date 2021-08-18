import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// If we want to show error to the user, we can use this

final exceptionProvider =
    StateNotifierProvider<GlobalExceptionState, Exception?>((ref) {
  return GlobalExceptionState(ref.read);
});

class GlobalExceptionState extends StateNotifier<Exception?> {
  final Reader _read;

  GlobalExceptionState(this._read) : super(null);

  void setError(Exception exception, [StackTrace? stackTrace]) {
    state = exception;

    _read(crashlyticsProvider).recordError(
      exception,
      stackTrace ??
          (exception is CustomException ? exception.stackTrace : null),
      reason: exception is CustomException ? exception.reason : 'unknown-error',
    );
  }
}
