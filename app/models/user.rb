class User < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.(com)/

	validates :full_name, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX, message: 'Please enter a valid email'}
	validates :password, presence: true
	has_secure_password

	# #manual encryption
	# def self.authenticate(email, password)
 #  user = User.find_by(email: email)
 #    ### user = User.find_by_email(params[:email])
 #    if user && user.authenticate(password)
 #    	user
 #   	else
 #   	# If user's login doesn't work, send them back to the login form.
 #    	nil
 #  	end
 #  end
	
end