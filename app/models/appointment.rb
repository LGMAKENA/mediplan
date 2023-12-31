class Appointment < ApplicationRecord 
    belongs_to :doctor
    belongs_to :patient

    validates :description, presence: true
    validates :date_time, presence: true
end