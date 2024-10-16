export function createStore(reducer, preloadedState, enhancer) {
      var t1;
      reducer.get$runtimeType(reducer);
      t1 = A.S(reducer.get$runtimeType(reducer));
      throw A.wrapException("Expected the root reducer to be a function. Instead, received: " + t1);
    }