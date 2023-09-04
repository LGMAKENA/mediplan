class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :full_name, :dob, :gender
end
