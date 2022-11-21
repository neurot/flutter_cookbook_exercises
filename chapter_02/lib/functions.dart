void functionsPlayground() {
  classicalFunctions();
  optionalParameters();
  consumeClosure();
}

void classicalFunctions() {
  printMyName('Raphael');
  printMyName('Michael');

  final sum = add(5, 3);
  print(sum);

  const num = 10;
  print('$num Factorial is ${factorial(num)}');
}

void optionalParameters() {
  unnamed('Huxley', 3);
  unnamed();

  named(greeting: 'Greetings and Salutations');
  named(name: 'Sonia');
  named(name: 'Alex', greeting: 'Bonjour');

  var multiply = duplicate('Mikey', times: 3);
  print(multiply);

  multiply = duplicate('Mikey');
  print(multiply);
}

void printMyName(String name) {
  print('Hello $name');
}

int add(int a, int b) {
  return a + b;
}

int factorial(int number) {
  if (number <= 0) {
    return 1;
  }

  return number * factorial(number - 1);
}

void unnamed([String? name, int? age]) {
  final actualName = name ?? 'Unknown';
  final actualAge = age ?? 0;
  print('$actualName is $actualAge years old.');
}

void named({String? greeting, String? name}) {
  final actualGreeting = greeting ?? 'Hello';
  final actualName = name ?? 'Mystery Person';
  print('$actualGreeting, $actualName');
}

String duplicate(String name, {int times = 10}) {
  String merged = '';
  for (int i = 0; i < times; i++) {
    merged += name;
    if (i != times - 1) {
      merged += ' ';
    }
  }
  return merged;
}

void callbackExample(void callback(String value)) {
  callback('Hello Callback');
}

void callbackExample2(void Function(String value) callback) {
  callback('Hello Callback');
}

typedef NumberGetter = int Function();

int powerOfTwo(NumberGetter getter) {
  return getter() * getter();
}

void consumeClosure() {
  getFour() => DateTime.now().microsecond;

  getFive() {
    return 5;
  }

  final squared = powerOfTwo(getFour);
  print(squared);

  final squared2 = powerOfTwo(getFive);
  print(squared2);

  callbackExample((value) {
    print(value);
  });
}
