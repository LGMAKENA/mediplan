class AddFullNameToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :full_name, :string
  end
end
