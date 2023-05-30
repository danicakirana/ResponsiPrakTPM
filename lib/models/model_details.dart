class CharactersModel {
  final String? name;
  final String? abilities;
  final String? role;
  final String? details;


  CharactersModel({
    this.name,
    this.abilities,
    this.role,
    this.details,

  });

  CharactersModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        role = json['role'] as String?,
        abilities = json['abilities'] as String?,
        details = json['details'] as String?,


  Map<String, dynamic> toJson() => {
    'name' : name,
    'role' : role,
    'abilities' : abilities,
    'details' : details

  };
}

class Detailll {
  final String? name;
  final String? role;
  final String? abilities;
  final String? details;

  Constellations({
    this.name,
    this.role,
    this.abilities,
    this.details,
  });

  Constellations.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        role = json['role'] as String?,
        details = json['details'] as String?,
        abilities = json['abilities'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'details' : details,
    'role' : role
  };
}