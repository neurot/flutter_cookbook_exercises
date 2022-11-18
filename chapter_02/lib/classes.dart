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
  OfficialName(this._title, String first, String last) : super(first, last);
}
