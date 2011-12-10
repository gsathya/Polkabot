require 'sqlite3'

db = SQLite3::Database.new("db/polkabot.db")
db.execute("CREATE TABLE factoid(name TEXT PRIMARY KEY,value TEXT)")
