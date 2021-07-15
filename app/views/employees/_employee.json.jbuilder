json.extract! employee, :id, :first_name, :last_name, :dob, :contact, :gender, :email, :skills, :country, :location, :industry, :about, :current_position, :created_at, :updated_at
json.url employee_url(employee, format: :json)
