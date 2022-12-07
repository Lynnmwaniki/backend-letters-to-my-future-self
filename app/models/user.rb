class User < ApplicationRecord
    has_many :public_letters, dependent: :destroy
    has_many :private_letters, dependent: :destroy

    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email
end
