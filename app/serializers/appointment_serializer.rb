class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :description, :date_time

  belongs_to :patient
end
