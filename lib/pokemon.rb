class Pokemon

    attr_accessor :id, :name, :type, :db
    # attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name 
        @type = type
        @db = db
    end 

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
        # why not using the below method?
        #@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 

    def self.find(id, db)
   
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL

        pokemon = db.execute(sql, id)[0]

        # id == pokemon[0][0]
        # name == pokemon[0][1]
        # type == pokemon[0][2]

        Pokemon.new(id:pokemon[0], name:pokemon[1], type:pokemon[2], db:db)
    end 

end
