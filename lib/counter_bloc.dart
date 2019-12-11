import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _actionController = PublishSubject<void>();
  Sink<void> get increment => _actionController.sink;

  final _countController = BehaviorSubject<int>.seeded(0);
  ValueObservable<int> get count => _countController;

  CounterBloc() {
    _actionController
        .scan<int>((sum, _v, _i) => sum + 1, 0)
        .pipe(_countController);
  }

  void dispose() {
    _actionController.close();
    _countController.close();
  }
}
