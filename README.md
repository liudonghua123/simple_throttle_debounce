A simple throttle/debounce library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
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

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/liudonghua123/simple_throttle_debounce/issues

## References

- https://programmingwithmosh.com/javascript/javascript-throttle-and-debounce-patterns/
- https://www.telerik.com/blogs/debouncing-and-throttling-in-javascript

## License

MIT License

Copyright (c) 2020 liudonghua
