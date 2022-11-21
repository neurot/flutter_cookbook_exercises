void collectionsPlayground() {
  listPlayground();
  mapPlayground();
  setPlayground();
  collectionControlFlow();
}

void collectionControlFlow() {
  final addMore = DateTime.now().microsecond.isEven;
  final randomNumbers = {
    34,
    342,
    25,
    24,
    234,
    if (addMore) ...[3423, 2342, 2342],
  };
  for (var element in randomNumbers) {
    print(element);
  }
}

void setPlayground() {
  final Set<String> ministers = {'Justin', 'Stephen', 'Paul', 'Jean'};
  ministers.addAll({'John', 'Paul'});

  print(ministers.contains('Paul'));

  for (var element in ministers) {
    print(element);
  }
}

void mapPlayground() {
  final Map<String, int> ages = {
    'Mike': 18,
    'Peter': 35,
    'Jennifer': 49,
    'Max': 1
  };

  ages['Tom'] = 48;

  ages.forEach((key, value) {
    print('$key : $value');
  });

  ages.remove('Sisi');
  ages.remove('Tom');

  ages.forEach((key, value) {
    print('$key : $value');
  });
}

void listPlayground() {
  final List<int> numbers = [1, 2, 3, 5, 7];

  numbers.add(10);
  numbers.addAll([4, 3, 5]);
  numbers[1] = 15;
  for (var element in numbers) {
    print(element);
  }
}
