class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :title
      t.string :full_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.datetime :dob
      t.string :gender

      t.timestamps
    end
  end
end
