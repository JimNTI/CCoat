require 'sqlite3'

db = SQLite3::Database.new("databas.db")


def seed!(db)
  puts "Using db file: db/databse.db"
  puts "🧹 Dropping old tables..."
  drop_tables(db)
  puts "🧱 Creating tables..."
  create_tables(db)
  puts "🍎 Populating tables..."
  populate_tables(db)
  puts "✅ Done seeding the database!"
end

def drop_tables(db)
  db.execute('DROP TABLE IF EXISTS creators')
  db.execute('DROP TABLE IF EXISTS merch')
  db.execute('DROP TABLE IF EXISTS social_medias')
  db.execute('DROP TABLE IF EXISTS users')
  db.execute('DROP TABLE IF EXISTS categories')
end

def create_tables(db)
  #users
  db.execute('CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              username TEXT NOT NULL, 
              email TEXT NOT NULL,
              pwd_digest TEXT NOT NULL,
              created_at TEXT
              )')

  db.execute('CREATE TABLE creators (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL, 
              real_name TEXT, 
              nationality TEXT, 
              age integer,
              about_me TEXT NOT NULL,
              profile_picture TEXT NOT NULL,
              banner_image TEXT NOT NULL,
              created_at TEXT
              )')    
  #categories
  db.execute('CREATE TABLE categories (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL
              )') 
  #Creator-Categories (many to many)
  db.execute('CREATE TABLE Creator-Categories(
              creator_id INTEGER
              category_id INTEGER
              PRIMARY KEY (creator_id, category_id)
              )')   

end



def populate_tables(db)
  db.execute('INSERT INTO creators (name, description, state) VALUES ("Köp mjölk", "3 liter mellanmjölk, eko",false)')
  db.execute('INSERT INTO creators (name, description, state) VALUES ("Köp julgran", "En rödgran",false)')
  db.execute('INSERT INTO creators (name, description, state) VALUES ("Pynta gran", "Glöm inte lamporna i granen och tomten",false)')
end


seed!(db)





