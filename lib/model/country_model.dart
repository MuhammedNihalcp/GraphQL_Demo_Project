class Continent {
  final String name;
  final String code;
  Countries countries;

  Continent({
    required this.name,
    required this.code,
    required this.countries,
  });
}

class Countries {
  final String code;
  final String name;
  Languages languages;
  final String capital;
  final String currency;
  final String phone;
  States states;

  Countries({
    required this.code,
    required this.name,
    required this.languages,
    required this.capital,
    required this.currency,
    required this.phone,
    required this.states,
  });
}

class Languages {
  final String name;
  Languages({
    required this.name,
  });
}

class States {
  String name;

  States({
    required this.name,
  });
}
