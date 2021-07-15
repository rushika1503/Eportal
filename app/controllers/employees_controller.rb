class EmployeesController < ApplicationController
  # before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end
  
  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.experiences.build
  end

  # GET /employees/1/edit

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @employee = Employee.find(params[:id])
  end
  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    # respond_to do |format|
    #   if @employee.update(employee_params)
    #     format.html { redirect_to @employee, notice: "Employee was successfully updated." }
    #     format.json { render :show, status: :ok, location: @employee }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @employee.errors, status: :unprocessable_entity }
    if employee.update(allowed_params)
      flash.now[:success] = "Saved the Employee Details"
      redirect_to employees_path
    else
      flash.now[:error] = "Unable to add the employee"
      render 'new'
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
     @employee = Employee.find(params[:id])
     @employee.destroy
    redirect_to employees_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_employee
    #   @employee = Employee.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :dob, :contact, :gender, :email, :skills, :country, :location, :industry, :about, :current_position, :image, :bgimage,
      experiences_attributes: [:id,:employees_id,:start_date,:end_date,:company_name,:title,:location,:employement_type])
    end
end
