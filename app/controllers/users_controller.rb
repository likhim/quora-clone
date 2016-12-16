require 'byebug'
enable :sessions

post '/signup' do
user = User.new(params[:user])
	if user.save
		redirect '/users/:id'
	else
		status 400
		user.errors.messages[:email]
	end
end

# works because authenticate method is call in models under has_secure_password
post '/login' do
user = User.find_by_email(params[:user][:email])
	if user && user.authenticate(params[:user][:password])
		session[:user_id] = user.id
		redirect '/users/:id'
	else
		redirect '/'
	end
end

##Manually encrypt and decrypt password
# post '/login' do
# user = User.authenticate(params[:user][:email],params[:user][:password])
# 	if user != nil
# 		session[:user_id] = user.id
# 		redirect '/users/:id'
# 	else
# 		redirect '/'
		## OR flash[:message] = "Invalid email/password. Pls try again?"
# 	end
# end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/users/:id' do
	erb :'/user/profile'
end





