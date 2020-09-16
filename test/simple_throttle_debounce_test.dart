import 'package:simple_throttle_debounce/simple_throttle_debounce.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    var simpleTask = () => print('simpleTask');
    var throttleSimpleTask, debounceSimpleTask;
    var interval = 1000;

    setUp(() {
      throttleSimpleTask = throttle(simpleTask, interval);
      debounceSimpleTask = debounce(simpleTask, interval);
    });

    test('Test return type', () {
      expect(throttleSimpleTask.runtimeType, dynamic);
      expect(debounceSimpleTask.runtimeType, dynamic);
    });
  });
}
