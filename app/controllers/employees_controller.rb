class EmployeesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: 'Employee created.'
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Employee updated.'
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path, notice: 'Employee deleted.'
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :designation)
  end
end
