final String tablePlants = 'plants';

class PlantFields {
  static final List<String> values = [id, name, type, lastWatered];

  static final String id = '_id';
  static final String name = 'name';
  static final String type = 'type';
  static final String lastWatered = 'lastWatered';
}

class Plant {
  // optional to pass in a value for id
  final int? id;
  final String name;
  final String type;
  final DateTime? lastWatered;

  Plant({
    this.id,
    required this.name,
    required this.type,
    DateTime? lastWatered,}) 
    : lastWatered = lastWatered ?? DateTime(2020);

  // creates a copy with the given fields replaced with the new values.
  Plant copy({
    int? id,
    String? name,
    String? type,
    DateTime? lastWatered,
  }) =>
      Plant(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        lastWatered: lastWatered ?? this.lastWatered,
      );

  static Plant fromJson(Map<String, Object?> json) => Plant(
        id: json[PlantFields.id] as int?,
        name: json[PlantFields.name] as String,
        type: json[PlantFields.type] as String,
        lastWatered: DateTime.parse(json[PlantFields.lastWatered] as String),
      );

  Map<String, Object?> toJson() => {
        PlantFields.id: id,
        PlantFields.name: name,
        PlantFields.type: type,
        PlantFields.lastWatered: lastWatered?.toIso8601String(),
      };

  @override
  String toString() {
    return 'Plant{id: $id, name: $name, type: $type, lastWatered: $lastWatered}';
  }
}
