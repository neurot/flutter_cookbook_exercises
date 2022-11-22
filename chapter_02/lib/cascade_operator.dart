void cascadePlayground() {
  final urlUgly = UrlBuilderUgly()
      .setScheme('https')
      .setHost('dart.dev')
      .setPath('guides/languages')
      .build();

  print(urlUgly);

  final url = UrlBuilder()
    ..scheme = 'https'
    ..host = 'dart.dev'
    ..routes = [
      'guides',
      'language',
      'language-tour#cascade-notation-',
    ];

  print(url);

  final numbers = [234, 2352223, 234, 232, 23423]
    ..insert(0, 10)
    ..sort((a, b) => a.compareTo(b));

  print('The largest nuber in the list is ${numbers.last}');
}

class UrlBuilder {
  String? scheme;
  String? host;
  List<String>? routes;

  @override
  String toString() {
    assert(scheme != null);
    assert(host != null);
    final paths = [host, if (routes != null) ...?routes];
    final path = paths.join('/');

    return '$scheme://$path';
  }
}

class UrlBuilderUgly {
  String _scheme = '';
  String _host = '';
  String _path = '';

  UrlBuilderUgly setScheme(String value) {
    _scheme = value;
    return this;
  }

  UrlBuilderUgly setHost(String value) {
    _host = value;
    return this;
  }

  UrlBuilderUgly setPath(String value) {
    _path = value;
    return this;
  }

  String build() {
    return '$_scheme://$_host/$_path';
  }
}
