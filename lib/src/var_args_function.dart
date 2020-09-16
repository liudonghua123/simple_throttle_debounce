// see more details on
// https://stackoverflow.com/questions/13731631/creating-function-with-variable-number-of-arguments-or-parameters-in-dart/13732459#13732459
// https://github.com/dart-lang/language/issues/1014
// https://github.com/dart-lang/language/issues/157

typedef VarArgsCallback = dynamic Function(List<dynamic>? positionalArguments, [Map<Symbol, dynamic>? namedArguments]);

class VarArgsFunction {
  final VarArgsCallback callback;
  static var _offset = 'Symbol("'.length;

  VarArgsFunction(this.callback);

  dynamic call() => callback([], {});

  @override
  dynamic noSuchMethod(Invocation inv) {
    return callback(
      inv.positionalArguments,
      inv.namedArguments.map(
        (_k, v) {
          var k = _k.toString();
          return MapEntry(Symbol(k.substring(_offset, k.length - 2)), v);
        },
      ),
    );
  }
}
