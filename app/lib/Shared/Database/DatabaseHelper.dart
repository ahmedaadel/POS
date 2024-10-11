import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? db;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (db != null) return db!;

    db = await initDB('pos_database.db');
    return db!;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  Future createDB(Database db, int version) async h{
    await db.execute('PRAGMA foreign_keys = ON');

    await db.execute('''
    CREATE TABLE industry (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT
    is_synced INTEGER NOT NULL DEFAULT 0);
    ''');

    await db.execute('''
    CREATE TABLE credit_type (
    id int PRIMARY KEY AUTOINCREMENT, 
    is_synced INTEGER NOT NULL DEFAULT 0,
    type TEXT NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0 );
    ''');

    // Create 'order_type' table
    await db.execute('''
    CREATE TABLE order_type (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      is_synced INTEGER NOT NULL DEFAULT 0,
      type TEXT NOT NULL);
  ''');

    // Create 'order_status' table
    await db.execute('''
    CREATE TABLE order_status (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      is_synced INTEGER NOT NULL DEFAULT 0,
      status TEXT NOT NULL);
  ''');

    // Create 'size' table
    await db.execute('''
    CREATE TABLE size (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      size_name TEXT NOT NULL,
      is_synced INTEGER NOT NULL DEFAULT 0);
  ''');

    await db.execute('''
    CREATE TABLE customer (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      contact_info_id INTEGER,
      client_id INTEGER NOT NULL,
      is_synced INTEGER NOT NULL DEFAULT 0,
      FOREIGN KEY (contact_info_id) REFERENCES contact_info (id) ON DELETE CASCADE,
      FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE);
  ''');

    await db.execute('''
    CREATE TABLE client (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    is_active INTEGER, 
    industry_id INTEGER,
    email TEXT,
    phone_number TEXT,
    business_name TEXT,
    is_synced INTEGER NOT NULL DEFAULT 0,
    CHECK (LENGTH(password) >= 8) -- Check constraint for password length ,
     FOREIGN KEY (industry_id) REFERENCES industry (id)  ON DELETE CASCADE);
''');
    await db.execute('''
  CREATE TABLE Addition (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price INTEGER,
    is_synced INTEGER NOT NULL DEFAULT 0,
    client_id INTEGER NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE,);
''');

    await db.execute('''
  CREATE TABLE "order" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subtotal_price REAL DEFAULT 0, 
    tax_price REAL DEFAULT 0,
    total_price REAL NOT NULL,
    discount_price REAL DEFAULT 0,
    service_fee REAL DEFAULT 0,
    is_synced INTEGER NOT NULL DEFAULT 0,
    order_date TEXT DEFAULT (DATETIME('now')),
    shift_id INTEGER NOT NULL,
    order_status INTEGER NOT NULL DEFAULT 0,
    notes TEXT,
    type INTEGER NOT NULL,
    delivery_info_id INTEGER,
    is_delivery_order INTEGER, -- BIT will be handled as INTEGER (0 or 1) in SQLite
    cashier_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    FOREIGN KEY (delivery_info_id) REFERENCES delivery_info (id) ON DELETE CASCADE,
    FOREIGN KEY (order_status) REFERENCES order_status (id) ON DELETE CASCADE,
    FOREIGN KEY (type) REFERENCES order_type (id) ON DELETE CASCADE,
    FOREIGN KEY (cashier_id) REFERENCES cashier (id) ON DELETE CASCADE,
    FOREIGN KEY (shift_id) REFERENCES shift (id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE);
''');

    await db.execute('''
    CREATE TABLE items_per_order (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    menu_item_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    subtotal_price REAL NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0,
    discount_price REAL DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES "order" (id) ON DELETE CASCADE,
    FOREIGN KEY (menu_item_id) REFERENCES menu_item (id) ON DELETE CASCADE);
''');
    await db.execute('''
    CREATE TABLE item_add_ons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    addition_id INTEGER NOT NULL,
    items_per_order_id INTEGER NOT NULL,
    additions_price REAL NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (addition_id) REFERENCES Addition (id) ON DELETE CASCADE,
    FOREIGN KEY (items_per_order_id) REFERENCES items_per_order (id) ON DELETE CASCADE);
''');

    await db.execute('''
    CREATE TABLE delivery_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    delivery_boy_id INTEGER,
    shipping_price REAL NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0,
    notes TEXT, 
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE CASCADE, 
    FOREIGN KEY (delivery_boy_id) REFERENCES delivery_boy (id) ON DELETE CASCADE
  );
''');
    await db.execute('''
    CREATE TABLE menu_item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    is_available INTEGER DEFAULT 1, 
    is_synced INTEGER NOT NULL DEFAULT 0,
    description TEXT,
    client_id INTEGER NOT NULL ,
    FOREIGN KEY (category_id) REFERENCES category (id)  ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE);
''');
    await db.execute('''
   CREATE TABLE item_size (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_id INTEGER NOT NULL,
    size INTEGER NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0,
    price REAL NOT NULL,
    FOREIGN KEY (size) REFERENCES size (id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES menu_item (id) ON DELETE CASCADE
  );
''');
    await db.execute('''
   CREATE TABLE shift (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    shift_date TEXT NOT NULL DEFAULT (datetime('now', 'localtime')), -- Use TEXT for date in SQLite
    start_hour TEXT NOT NULL, -- Use TEXT for TIME in SQLite
    end_hour TEXT NOT NULL, -- Use TEXT for TIME in SQLite
    cashier_id INTEGER NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0,
    balance REAL,
    client_id INTEGER NOT NULL,
    FOREIGN KEY (cashier_id) REFERENCES cashier (id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE);
''');
    await db.execute('''
  CREATE TABLE credit_debit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount REAL NOT NULL,
    type INTEGER NOT NULL,
    description TEXT NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0,
    shift_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    FOREIGN KEY (type) REFERENCES credit_type (id) ON DELETE CASCADE,
    FOREIGN KEY (shift_id) REFERENCES shift (id) ON DELETE CASCADE,
     FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE);
''');
    await db.execute('''
   CREATE TABLE supplier (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    contact_info_id INTEGER,
    is_synced INTEGER NOT NULL DEFAULT 0,
    client_id INTEGER NOT NULL,
    FOREIGN KEY ([contact_info_id]) REFERENCES [contact_info] ([id]) ON DELETE CASCADE, 
    FOREIGN KEY ([client_id]) REFERENCES [client] ([id]) ON DELETE CASCADE);
''');
    await db.execute('''
  CREATE TABLE cashier (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    contact_info_id INTEGER,
    client_id INTEGER NOT NULL,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    CHECK (LENGTH(password) >= 8),
    FOREIGN KEY (contact_info_id) REFERENCES contact_info (id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE
  );
''');
    await db.execute('''
    CREATE TABLE delivery_boy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    contact_info_id INTEGER,
    client_id INTEGER NOT NULL ,
    is_synced INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (contact_info_id) REFERENCES contact_info (id),
    FOREIGN KEY (client_id) REFERENCES client (id) );
''');
    await db.execute('''
   CREATE TABLE contact_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phone_number TEXT,
    is_synced INTEGER NOT NULL DEFAULT 0,
    additional_number TEXT,
    address TEXT  );
''');
    await db.execute('''
  CREATE TABLE contact_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phone_number TEXT,
    additional_number TEXT,
    address TEXT,
    is_synced INTEGER NOT NULL DEFAULT 0);
''');

    await db.execute('''
  CREATE TABLE category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    parent_id INTEGER,
    client_id INTEGER NOT NULL,
    is_synced INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (parent_id) REFERENCES category (id) ON DELETE CASCADE ,
    FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE);
''');

    await db.execute('''
  CREATE TABLE statistics (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT,  -- Use TEXT for DATE in SQLite
    target_per_day REAL,
    actual_balance_per_day REAL,
    variance REAL,
    variance_type TEXT,
    is_synced INTEGER NOT NULL DEFAULT 0,
    client_id INTEGER,
    FOREIGN KEY (client_id) REFERENCES client (id)
  );
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
