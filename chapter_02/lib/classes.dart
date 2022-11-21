void classPlayground() {
  final name = OfficialName('Mr', 'Francois', 'Rabelais');
  final message = name.toString();
  print(message);

  final name2 = OfficialName('Mrs', 'Raphaelle');
  print(name2.toString());

  var stud = Studer();
  stud.add(4, 4);
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

class OfficialName extends Name {
  // Private props begin with an underscore
  final String _title;

  // Add colons after constructor to parse data or delegate to super
  OfficialName(this._title, String first, [String last = 'NoName'])
      : super(first, last);

  @override
  String toString() {
    return '$_title. ${super.toString()}';
  }
}

class MoreName implements Name {
  @override
  final String first;
  @override
  final String last;

  MoreName(this.first, this.last);
}

abstract class Person {
  void sayHello() {
    print('Person says hello.');
  }

  void walking();
}

abstract class HomoSapien {
  void sayGoodbye() {
    print('Person says hello.');
  }

  void walking();
}

class Student implements Person, HomoSapien {
  void goToClass() {
    print('Student goes to class.');
  }

  @override
  void walking() {}

  @override
  void sayHello() {
    // TODO: implement sayHello
  }

  @override
  void sayGoodbye() {
    // TODO: implement sayGoodbye
  }
}

class Studer extends Student with Adder, Subber {}

mixin Adder {
  void add(int x, int z) {
    print('${x + z}');
  }
}

class Subber {
  void add(int x, int z) {
    print('${x - z}');
  }
}
