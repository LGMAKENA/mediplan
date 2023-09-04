class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.datetime :dob
      t.string :gender

      t.timestamps
    end
  end
end
