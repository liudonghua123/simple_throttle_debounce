import 'dart:async';
import './var_args_function.dart';

/// throttle high order function.
///
/// This function accept a [callback] function and a [interval] in miliseconds unit.
///
/// It is a dart implementation of throttle, see more details on:
/// - https://programmingwithmosh.com/javascript/javascript-throttle-and-debounce-patterns/
/// - https://www.telerik.com/blogs/debouncing-and-throttling-in-javascript
dynamic throttle(Function callback, int interval) {
  var enableCall = true;
  return VarArgsFunction((List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    if (!enableCall) return;
    enableCall = false;
    Function.apply(callback, positionalArguments, namedArguments);
    Future.delayed(Duration(milliseconds: interval), () => enableCall = true);
  });
}

/// debounce high order function.
///
/// This function accept a [callback] function and a [interval] in miliseconds unit.
///
/// It is a dart implementation of debounce, see more details on:
/// https://programmingwithmosh.com/javascript/javascript-throttle-and-debounce-patterns/
/// https://www.telerik.com/blogs/debouncing-and-throttling-in-javascript
dynamic debounce(Function callback, int interval) {
  Timer debounceTimeoutId;
  return VarArgsFunction((List<dynamic> positionalArguments,
      [Map<Symbol, dynamic> namedArguments]) {
    debounceTimeoutId?.cancel();
    debounceTimeoutId = Timer(Duration(milliseconds: interval),
        () => Function.apply(callback, positionalArguments, namedArguments));
  });
}
