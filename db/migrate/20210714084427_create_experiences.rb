class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.date :start_date
      t.date :end_date
      t.string :company_name
      t.string :title
      t.string :location
      t.string :employement_type

      t.timestamps
    end
  end
end
