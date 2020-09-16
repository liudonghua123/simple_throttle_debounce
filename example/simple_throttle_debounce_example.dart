import 'dart:async';

import 'package:simple_throttle_debounce/simple_throttle_debounce.dart';

void main() async {
  var limit = 100;
  var tick = 0;
  var interval = 1000;
  var simpleTask = (tick, {name = 'simpleTask'}) => print('tick: $tick, name: $name');
  dynamic throttleSimpleTask = throttle(simpleTask, interval);
  dynamic debounceSimpleTask = debounce(simpleTask, interval);
  while (true) {
    print(tick);
    throttleSimpleTask(tick, name: 'throttleSimpleTask');
    debounceSimpleTask(tick, name: 'debounceSimpleTask');
    await Future.delayed(Duration(milliseconds: 100), () => tick++);
    if (tick > limit) break;
  }
}
