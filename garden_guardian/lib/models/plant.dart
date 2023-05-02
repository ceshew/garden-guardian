final String tablePlants = 'plants';

class PlantFields {
  static final List<String> values = [id, name, type];

  static final String id = '_id';
  static final String name = 'name';
  static final String type = 'type';
}

class Plant {
  // optional to pass in a value for id
  final int? id;
  final String name;
  final String type;

  const Plant({
    this.id,
    required this.name,
    required this.type,
  });

  // creates a copy with the given fields replaced with the new values.
  Plant copy({
    int? id,
    String? name,
    String? type,
  }) =>
      Plant(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  static Plant fromJson(Map<String, Object?> json) => Plant(
    id: json[PlantFields.id] as int?,
    name: json[PlantFields.name] as String,
    type: json[PlantFields.type] as String,
  );

  Map<String, Object?> toJson() => {
        PlantFields.id: id,
        PlantFields.name: name,
        PlantFields.type: type,
  };

  @override
  String toString() {
    return 'Plant{id: $id, name: $name, type: $type}';
  }
}
