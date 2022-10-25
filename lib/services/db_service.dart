//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
//
// class DatabaseManager{
//   late Database _database;
//   Future<Database> initDb() async {
//     _database = await openDatabase(join(await getDatabasesPath(), "user1.db"),
//         version: 1, onCreate: (Database db, int version) async {
//           await db.execute(
//             "CREATE TABLE user(id INTEGER PRIMARY KEY autoincrement, mobile TEXT NOT NULL, mpin TEXT NOT NULL)",
//           );
//           // await db.execute(
//           //     'CREATE TABLE Site (id INTEGER , url TEXT,'
//           //         ' siteName TEXT ,sector TEXT, socialMedia Text ,username Text ,password Text, notes Text,FOREIGN KEY(id) REFERENCES user(id)');
//         });
//     return _database;
//   }
//
//   Future<void> insertModel(UserModel model) async {
//     await initDb();
//     await _database.insert('user', model.toJson());
//     final response = await _database.query('user');
//     print(response);
//   }
//
//   Future<List<UserModel>> getUser() async {
//     final db = await initDb();
//     final List<Map<String, dynamic>> queryResult = await db.query('user');
//     final response = await _database.query('user');
//     final List<UserModel> users = [];
//     for(var row in response) {
//       print(row);
//       final user = UserModel(
//           id:row['id'] as int,
//           mobile: row['mobile'] as String,
//           mPin: row['mpin'] as String);
//       users.add(user);
//     }
//     return users;
//   }
//
// }

// class User {
//   int? id;
//   final String mobile;
//   final String mPin;
//
//   User({this.id, required this.mobile, required this.mPin});
//
//   User fromJson(json) {
//     return User(
//         id:json['id'], mobile: json['mobile'], mPin: json['mPin']);
//   }
//
//   Map<String, dynamic> toJson() {
//     return {'id': id, 'mobile': mobile, "mPin": mPin};
//   }
// }