class PatientSerializer < ActiveModel::Serializer
  attributes :id, :dob, :gender, :username 
end 

