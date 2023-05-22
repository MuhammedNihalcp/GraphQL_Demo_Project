class Continent {
  final String name;
  final String code;
  List<Countries> countries;

  Continent({
    required this.name,
    required this.code,
    required this.countries,
  });
  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        name: json['name'],
        code: json['code'],
        countries: List<Countries>.from(
          json['countries'].map(
            (e) => Continent.fromJson(json),
          ),
        ),
      );
}

class Countries {
  final String code;
  final String name;
  List<Languages> languages;
  final String capital;
  final String currency;
  final String phone;
  List<States> states;

  Countries({
    required this.code,
    required this.name,
    required this.languages,
    required this.capital,
    required this.currency,
    required this.phone,
    required this.states,
  });

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        code: json['code'],
        name: json['name'],
        languages: List<Languages>.from(
          json['languages'].map(
            (e) => Languages.fromJson(json['languages']),
          ),
        ),
        capital: json['capital'],
        currency: json['currency'],
        phone: json['phone'],
        states: List<States>.from(
          json['languages'].map(
            (e) => Languages.fromJson(json['states']),
          ),
        ),
      );
}

class Languages {
  final String name;
  Languages({
    required this.name,
  });
  factory Languages.fromJson(Map<String, dynamic> json) =>
      Languages(name: json['name']);
}

class States {
  String name;

  States({
    required this.name,
  });
  factory States.fromJson(Map<String, dynamic> json) =>
      States(name: json['name']);
}
