import 'package:rxdart/rxdart.dart';

class Bloc {

  BehaviorSubject<int> _counterStreamCtrl = BehaviorSubject<int>(seedValue: 0);

  Stream<int> get counterStream => _counterStreamCtrl.stream;

  void addCounter() {
    int currentValue = _counterStreamCtrl.value;
    _counterStreamCtrl.add(currentValue+1);
  }

  void dispose() {
    _counterStreamCtrl.close();
  }

}