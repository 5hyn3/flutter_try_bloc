import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _actionController = PublishSubject<void>();
  Sink<void> get increment => _actionController.sink;

  final _countController = BehaviorSubject<int>.seeded(0);
  ValueObservable<int> get count => _countController;

  int _count = 0;

  CounterBloc() {
    _actionController.stream.listen((_) {
      // この部分に各種計算やAPIアクセスなどのロジックを記述する。
      _count++;
      _countController.sink.add(_count);
    });
  }

  void dispose() {
    _actionController.close();
    _countController.close();
  }
}
