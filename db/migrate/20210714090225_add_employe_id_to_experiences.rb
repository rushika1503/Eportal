class AddEmployeIdToExperiences < ActiveRecord::Migration[6.1]
  def change
    add_column :experiences, :employee_id, :integer
    add_index :experiences, :employee_id
  end
end
