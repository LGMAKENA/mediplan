class PatientSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :dob, :gender, 
end
