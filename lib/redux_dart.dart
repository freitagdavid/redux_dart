int calculate() {
  return 6 * 7;
}

createStore(reducer, preloadedState, enhancer, [rest]) {
  if (reducer.runtimeType != Function) {
    throw 'Expected the root reducer to be a function. Instead, received: ${reducer.runtimeType}';
  }

  if ((preloadedState.runtimeType == Function &&
          enhancer.runtimeType == Function) ||
      (preloadedState.runtimeType == Function &&
          rest.runtimeType == Function)) {
    throw 'It looks like you are passing several store enhancers to \ncreateStore(). This is not supported. Instead, compose them \ntogether to a single function. See https://redux.js.org/tutorials/fundamentals/part-4-store#creating-a-store-with-enhancers for an example.';
  }

  var currentReducer = reducer;
  var currentState = preloadedState;
  var currentListeners = new Map();
  var nextListeners = currentListeners;
  var listenerIdCounter = 0;
  var isDispatching = false;

  ensureCanMutateNextListeners() {
    if (nextListeners == currentListeners) {
      nextListeners = {};
      currentListeners
          .forEach((listener, key) => nextListeners[key] = listener);
    }
  }

  getState() {
    if (isDispatching) {
      throw 'You may not call store.getState() while the reducer is executing. \nThe reducer has already received the state as an argument.\nPass it down from the top reducer instead of reading it from the store.';
    }
    return currentState;
  }

  subscribe(listener) {
    if (listener.runtimeType != Function) {
      throw 'Expected listener to be a function. Instead, received ${listener.runtimeType}';
    }
    if (isDispatching) {
      throw 'You may not call store.subscribe() while the reducer is executing. \nIf you would like to be notified after the store has been updated, subscribe from a \ncomponent and invoke store.getState() in the callback to access the latest state. \nSee https://redux.js.org/api/store#subscribelistener for more details.';
    }
  }
}
