// see also 101 linq samples in dart
void higherOrderFunctionsPlayground() {
  mapping();
  sorting();
  filtering();
  reducing();
  flattening();
}

List<Map> data = [
  {'first': 'Nada', 'last': 'Mueller', 'age': 10},
  {'first': 'Kurt', 'last': 'Gibbons', 'age': 9},
  {'first': 'Natalya', 'last': 'Compton', 'age': 15},
  {'first': 'Kaycee', 'last': 'Grant', 'age': 20},
  {'first': 'Kody', 'last': 'Ali', 'age': 17},
  {'first': 'Rhodri', 'last': 'Marshall', 'age': 30},
  {'first': 'Kali', 'last': 'Fleming', 'age': 9},
  {'first': 'Steve', 'last': 'Goulding', 'age': 32},
  {'first': 'Ivie', 'last': 'Haworth', 'age': 14},
  {'first': 'Anisha', 'last': 'Bourne', 'age': 40},
  {'first': 'Dominique', 'last': 'Madden', 'age': 31},
  {'first': 'Kornelia', 'last': 'Bass', 'age': 20},
  {'first': 'Saad', 'last': 'Feeney', 'age': 2},
  {'first': 'Eric', 'last': 'Lindsey', 'age': 51},
  {'first': 'Anushka', 'last': 'Harding', 'age': 23},
  {'first': 'Samiya', 'last': 'Allen', 'age': 18},
  {'first': 'Rabia', 'last': 'Merrill', 'age': 6},
  {'first': 'Safwan', 'last': 'Schaefer', 'age': 41},
  {'first': 'Celeste', 'last': 'Aldred', 'age': 34},
  {'first': 'Taio', 'last': 'Mathews', 'age': 17},
];

void flattening() {
  final matrix = [
    [1, 0, 0],
    [0, 0, -1],
    [0, 1, 0],
  ];

  print('');
  final linear = matrix.expand<int>((row) => row);
  print(linear);
}

void reducing() {
  final allAges = data.map<int>((person) => person['age']);
  final total = allAges.reduce((total, age) => total + age);
  final average = total / allAges.length;

  print('');
  print('The average age is $average');

  // fold -> start total with -1000
  // final oddTotal = allAges.fold<int>(-1000, (total, age) => total + age);
}

void filtering() {
  final onlyMs = doMap().where((name) => name.last.startsWith('M'));

  print('');
  print('Filtered List by "starts with M');
  onlyMs.forEach(print);
}

void sorting() {
  final names = doMap();

  names.sort((a, b) => a.last.compareTo(b.last));

  print('');
  print('Alphabetical List of Names:');
  names.forEach(print);
}

void mapping() {
  final names = doMap();
  names.forEach(print);
}

class Name {
  final String first;
  final String last;

  Name(this.first, this.last);

  @override
  String toString() {
    return '$first $last';
  }
}

List<Name> doMap() {
  // Transform the data from raw maps to a strongly typed model
  final names = data.map<Name>((Map rawName) {
    return Name(rawName['first'], rawName['last']);
  }).toList();

  return names;
}
