import 'package:dio/dio.dart';

int getnthPrime(int n) {
  int currentPrimeCount = 0;
  int candidate = 1;

  while (currentPrimeCount < n) {
    ++candidate;
    if (_isPrime(candidate)) {
      ++currentPrimeCount;
    }
  }
  return candidate;
}

bool _isPrime(int val) {
  for (var i = 2; i * i <= val; ++i) {
    if (val % i == 0) {
      return false;
    }
  }
  return true;
}
