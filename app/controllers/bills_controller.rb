class BillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bill, only: %i[approve reject update destroy] # Ensure edit is included if you have it

  def new
    @bill = Bill.new
    @employees = Employee.all.map { |e| [e.full_name, e.id] }
    Rails.logger.debug("Employees Collection: #{@employees.inspect}")
  end

  def create
    @bill = current_user.bills.build(bill_params)
    @bill.status = 'pending'
    if @bill.save
      redirect_to view_submitted_bills_path, notice: 'Bill submitted.'
    else
      render :new
    end
  end

  def index
    @bills = current_user.bills
  end

  def view_all
    @bills = Bill.all
  end

  def destroy
  @bill.destroy
  redirect_to view_all_bills_path, notice: 'Bill was successfully deleted.'
end


  def update
    if current_user.admin? && @bill.update(bill_params)
      redirect_to view_all_bills_path, notice: 'Bill updated.'
    else
      redirect_to view_submitted_bills_path, alert: 'Access denied or update failed.'
    end
  end

  def approve
    @bill.update(status: :approved)
  respond_to do |format|
    format.html { redirect_to view_all_bills_path, notice: 'Bill was successfully approved.' }
    format.turbo_stream
  end
    end

  def reject
    @bill.update(status: :rejected)
    redirect_to view_all_bills_path, notice: 'Bill was successfully rejected.'
  end

  private

    def set_bill
      @bill = Bill.find(params[:id])
    end

    def bill_params
      params.require(:bill).permit(:amount, :bill_type, :status, :employee_id)
    end
end
