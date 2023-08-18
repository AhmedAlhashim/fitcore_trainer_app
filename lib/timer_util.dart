import 'dart:async';
// Single Responsibility Principle's applied here

class TimerUtil {
  late Timer _timer;
  bool _isActive = false;

  bool get isActive => _isActive;

  void startTimer(void Function(Duration) onTick) {
    if (!_isActive) {
      _isActive = true;
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        onTick((timer.tick * 100) as Duration);
      });
    }
  }

  void stopTimer() {
    if (_isActive) {
      _isActive = false;
      _timer.cancel();
    }
  }

  void resetTimer() {
    stopTimer();
  }
}
