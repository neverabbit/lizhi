class CustomersController < ApplicationController
  
  before_action :logged_in_user, only: [:index]
  
  def new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
      # render 'new'
    end
  end
  
  def index 
    @customers = Customer.order('created_at DESC').paginate(page: params[:page])
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :phone, :email, :position, :company, :comment)
  end
  
end
