class Doctor < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :patients, through: :appointments

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 
    validates :full_name, presence: true
end
