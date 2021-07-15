class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :contact
      t.string :gender
      t.string :email
      t.string :skills
      t.string :country
      t.string :location
      t.string :industry
      t.string :about
      t.string :current_position

      t.timestamps
    end
  end
end
