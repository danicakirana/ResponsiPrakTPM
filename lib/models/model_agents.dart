class CharactersModel {
  final String? name;
  final String? role;


  CharactersModel({
    this.name,
    this.role,

  });

  CharactersModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        role = json['role'] as String?,


  Map<String, dynamic> toJson() => {
    'name' : name,
    'role' : role,

  };
}
