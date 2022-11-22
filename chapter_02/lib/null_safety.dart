void nullSafetyPlayground() {
  int? someNumber;
  increaseValue1(someNumber);
  increaseValue2(someNumber);
  someNumber = 0;
  increaseValue3(someNumber);
}

void increaseValue3(int value) {
  value++;

  print(value);
}

void increaseValue2(int? value) {
  value = value ?? 0;
  value++;

  print(value);
}

void increaseValue1(int? value) {
  if (value != null) {
    value++;
  } else {
    value = 1;
  }

  print(value);
}
