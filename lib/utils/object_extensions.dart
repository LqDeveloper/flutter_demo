
extension MapObject<T> on T {
  E map<E>(E f(T e)) {
    return f(this);
  }
}

