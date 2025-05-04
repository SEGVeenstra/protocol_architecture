import 'package:protocol_architecture_test/mvvm/base/view_model.dart';
import 'package:protocol_architecture_test/mvvm/counter_state.dart';
import 'package:protocol_architecture_test/repositories/counter_repository.dart';

class CounterViewModel extends ViewModel<CounterState> {
  CounterViewModel(this._counterRepository) : super(CounterState());

  final CounterRepository _counterRepository;

  @override
  Future<void> init() async {
    final count = await _counterRepository.getCounter();
    setState(CounterState(count));
    notifyListeners();
  }

  Future<void> increment() async {
    final newCount = state.count + 1;
    setState(CounterState(newCount));
    await _counterRepository.saveCounter(newCount);
    notifyListeners();
  }

  Future<void> clear() async {
    setState(CounterState(0));
    await _counterRepository.saveCounter(0);
    notifyListeners();
  }
}
