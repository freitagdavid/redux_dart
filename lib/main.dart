import 'dart:js_interop';
import './redux_dart.dart' as redux;

@JS()
external set exportedFunction(JSFunction value);

JSFunction createStore(
    JSFunction reducer, JSObject preloadedState, JSFunction enhancer) {
  return redux.createStore(reducer, preloadedState, enhancer);
}

main() {
  exportedFunction = createStore.toJS;
}
