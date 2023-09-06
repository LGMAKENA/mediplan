class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :title, :dob, :gender, :full_name, :username  
end
