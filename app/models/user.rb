#require 'bcrypt'
class User < ApplicationRecord::Base
    #include Bcrypt

    has_many :public_letters, dependent: :destroy
    has_many :private_letters, dependent: :destroy

    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email
    
    #creating a password
    # def password 
    #     @password || = Password.new(password_hash)
    # end

    # def password = (new_password)
    #     @password = Password.create(new_password)
    #     self.password_hash = @password
    # end

    #creating an account/signup
    # def create
    #     @user = User.new(params[:user])
    #     @user.password = params[:password]
    #     @user.save!
    # end

    #authenticating a user
    # def login
    #     @user = User.find_by_email(params[:email])
    #     if @user.password == params[:password]
    #         give_token
    #     else
    #         redirect_to_home_url
    #     end
    # end
end
