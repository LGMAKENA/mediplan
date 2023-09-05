class Patient < ApplicationRecord 
    has_secure_password
    has_many :appointments
    has_many :doctors, through: :appointments

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 
    
end 
