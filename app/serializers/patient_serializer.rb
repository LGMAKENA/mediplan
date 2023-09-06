class PatientSerializer < ActiveModel::Serializer

  attributes :id, :dob, :gender, :username, :email, :full_name

  has_many :appointments
end 


