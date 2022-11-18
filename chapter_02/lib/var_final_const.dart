void varFinalConst() {
  variablePlayground();
  stringPlayground();
}

void variablePlayground() {
  basicTypes();
  untypedVariables();
  typeInterpolation();
  immutableVariables();
}

void basicTypes() {
  int four = 4;
  double pi = 3.14;
  num someNumber = 24601;
  bool yes = true;
  bool no = false;
  // int nothing = null;

  print(four);
  print(pi);
  print(someNumber);
  print(yes);
  print(no);
  // print(nothing == null);
}

void untypedVariables() {
  dynamic something = 14.2;
  print(something.runtimeType);
}

void typeInterpolation() {
  var anInteger = 15;
  print(anInteger.runtimeType);
  print(anInteger);

  var aDouble = 27.5;
  print(aDouble.runtimeType);
  print(aDouble);

  var aBoolean = true;
  print(aBoolean.runtimeType);
  print(aBoolean);
}

void immutableVariables() {
  final int immutableInteger = 5;
  final double immutableDouble = 0.015;
  print(immutableInteger);
  print(immutableDouble);

  final interpolatedInteger = 10;
  final interpolatedDouble = 72.8;
  print(interpolatedInteger.runtimeType);
  print(interpolatedInteger);
  print(interpolatedDouble.runtimeType);
  print(interpolatedDouble);

  const aFullySealedVariable = true;
  print(aFullySealedVariable.runtimeType);
  print(aFullySealedVariable);

  final aDate = DateTime.now();
  print(aDate.runtimeType);
  print(aDate);
  // this will throw an error
  // aDate = DateTime.now();

  //this is not allowed, since it's not determined at compile time
  //const aDate = DateTime.now();
}

void stringPlayground() {
  final hamlet = '''
To be, or not tobe, that is the question:
Lorem blah lbah.
''';
  print(hamlet);

  final age = 35;
  final howOld = 'I am $age ${age == 1 ? 'year' : 'years'} old.';
  print(howOld);

  final List fruits = ['Apple', 'Mango', 'Banana'];
  fruits.add('Orange'); //possible with final, not allowed with const
  StringBuffer buffer = StringBuffer();
  for (String fruit in fruits) {
    buffer.write(fruit);
    buffer.write(' ');
  }
  print(buffer.toString());
}
