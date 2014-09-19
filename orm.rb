require 'sqlite3'
require 'pry'

class User 

	attr_reader :id, :email, :password
	attr_accessor :email, :password

	def initialize(data)
		@id = data['id']
		@email = data['email']
		@password = data['password']
	end
		
end

class Post 

	attr_reader :id, :author, :title, :content
	attr_writer :title, :content
	def initialize(data)
		@id = data['id']
		@author = data['author']
		@title = data['title']
		@content = data['content']
	end

class ORM

		TABLE_CLASS_MAP = {
			:user => User
		}

		DB_FILE = 'journal.db'

		def initialize
			connect_to_database
		end

		

		def connect_to_database
			@db = SQLite3::Database.new(DB_FILE)
		end

		def show
			@db.execute <<-SQL
				SELECT * FROM users;
			SQL
		end

		def save_user(user)
			@db.execute <<-SQL
				INSERT INTO users
				(email, password)
				VALUES 
				("#{user.email}", "#{user.password}");

			SQL
		end

end#end of ORM 

# def main 
# 	example = ORM.new
# 	puts example.show
# end 

# main 
