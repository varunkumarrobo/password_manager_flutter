import 'package:mini_app/models/modelsdb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseService {
  static final DatabaseService instance = DatabaseService._privateConstructor();

  DatabaseService._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Test.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 2, onCreate: _createDB, onUpgrade: _upgrade);
  }

  _upgrade(Database db, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {
      db.execute("ALTER TABLE Site ADD AGE INTEGER");
    }
  }

  Future _createDB(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE Site (id INTEGER PRIMARY KEY AUTOINCREMENT, url TEXT,'
              ' siteName TEXT ,sector TEXT, socialMedia Text ,username Text ,password Text, notes Text)');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Site>> getAllSite() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM Site');
    print("Site is ${result}");
    return result.length > 0
        ? result.map((json) => Site.fromJson(json)).toList()
        : [];
  }

  Future<Site> getSite(int id) async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT * FROM Site WHERE id=${id}');

    return result.map((json) => Site.fromJson(json)).toList()[0];
  }

  Future createSite(Map<String, dynamic> site) async {
    final db = await instance.database;

    try {
      int result = await db.insert('Site', site);

      return "Record inserted";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }

  Future updateSite(Map<String, dynamic> Site) async {
    final db = await instance.database;

    try {
      int result = await db
          .update('Site', Site, where: 'id = ?', whereArgs: [Site["id"]]);

      return "Record updated";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }

  Future deleteSite(int id) async {
    final db = await instance.database;

    try {
      int result = await db.delete('Site', where: 'id = ?', whereArgs: [id]);

      return "Record deleted";
    } catch (e) {
      print(e);
      return Exception("Something went wrong");
    }
  }
}
