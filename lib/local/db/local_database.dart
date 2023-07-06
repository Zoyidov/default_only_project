import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Contact {
  int? id;
  String name;
  String surname;
  String phoneNumber;
  String image;

  Contact({
    this.id,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      surname: map['surname'],
      phoneNumber: map['phoneNumber'],
      image: map['image'],
    );
  }
}

class ContactDatabase {
  static final ContactDatabase _instance = ContactDatabase.internal();

  factory ContactDatabase() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  ContactDatabase.internal();

  Future<Database> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contact_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Contact (
            id INTEGER PRIMARY KEY,
            name TEXT,
            surname TEXT,
            phoneNumber TEXT,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertContact(Contact contact) async {
    Database db = await database;
    return await db.insert('Contact', contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('Contact');
    return List.generate(maps.length, (i) {
      return Contact.fromMap(maps[i]);
    });
  }

  Future<int> updateContact(Contact contact) async {
    Database db = await database;
    return await db.update(
      'Contact',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> deleteContact(int id) async {
    Database db = await database;
    return await db.delete(
      'Contact',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<void> deleteContacts() async {
    Database db = await database;
     await db.delete(
      'Contact',

    );
  }

  Future closeDatabase() async {
    Database db = await database;
    db.close();
  }
}