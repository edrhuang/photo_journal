require 'sqlite3'
require 'rack/request'
require 'rack/response'
require 'pry'
require 'erubis'
require 'ap'
require_relative 'orm'

module Journal 
	
	class User 

		attr_reader :id, :email, :password
		attr_accessor :email, :password

		def initialize(data)
			
			@email = data[:email]
			@password = data[:password]
			
		end
		
	end

	# class Post 
	# 	attr_reader :author, :contents, :id
	#     attr_writer :author, :contents
	#     @@counter = 1

	#     def initialize(author, contents)
	#         @author = author
	#         @contents = contents
	#         @id = @@counter
	#         @@counter +=1
	#     end

	# end

	class App 
		def initialize()
			@orm = ORM.new	
		end#end of intialize()

		def render(name, locals={})#locals is the variables, but when there isnt one needed, an emptyy hash is passed
            file = File.read("views/"+name+".erb")#creates a new file with the name being the function 
            Erubis::Eruby.new(file).result(locals)
        end#end of render 

        def call(env)
            ap env
            request = Rack::Request.new(env)
            response = Rack::Response.new

            case request.path_info

            when '/post/index', '/'
                response.write render("index", {posts: @posts})
            when '/users'
            	email = request.POST['email']
            	password = request.POST['password']
            	user_info = {email: email, password: password}

            	n_user = User.new(user_info)
            	
            	@orm.save_user n_user
            	response.write render("users", {:user_object => n_user})
            	# response.redirect "/"
                
               

            
            else
            	response.status = 404
            	response.write "Error Erroe Er..."
            # when '/post/wahh'
            #     response.status = 404
            end


            # response = handle_request(request)
            
            return response.finish()
		end #end of call()  

	end #end of App 

	

	# def main()
	# 	#store users email and password 
	# 	user.email = "edrhuang@gmail.com"
	# 	user.password = "my_password"

	# 	orm.save_user user
	# end

	# main()
end




