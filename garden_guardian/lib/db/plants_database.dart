import 'package:garden_guardian/models/plant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PlantsDatabase {
  static final PlantsDatabase instance = PlantsDatabase._init();

  static Database? _database;

  PlantsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('plants.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute("""
      CREATE TABLE $tablePlants (
        ${PlantFields.id} $idType,
        ${PlantFields.name} $textType,
        ${PlantFields.type} $textType
      )
     """);
  }

  Future<Plant> create(Plant plant) async {
    final db = await instance.database;

    final id = await db.insert(tablePlants, plant.toJson());
    return plant.copy(id: id);
  }

  Future<Plant> readPlant(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePlants,
      columns: PlantFields.values,
      where: '${PlantFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Plant.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Plant>> readAllPlants() async {
    final db = await instance.database;

    final orderBy = '${PlantFields.id} ASC';
    final result = await db.query(tablePlants, orderBy: orderBy);

    return result.map((json) => Plant.fromJson(json)).toList();
  }

  Future<int> update(Plant plant) async {
    final db = await instance.database;

    return db.update(
      tablePlants,
      plant.toJson(),
      where: '${PlantFields.id} = ?',
      whereArgs: [plant.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePlants,
      where: '${PlantFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
