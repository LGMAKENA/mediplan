class PatientSerializer < ActiveModel::Serializer

  attributes :id, :dob, :gender, :username, :email
   has_many :appointments
end 


