class CompaniesController < ApplicationController
  include CompaniesHelper
  # include UsersController
  
  before_action :logged_in_user, only: [:new, :edit, :update, :delete]
  
  def new
    @company = Company.new
  end
  
  def create 
    @company = Company.new(company_params)
    if @company.save
      render @company
    else
      render 'new'
    end
  end
  
  def show 
    @company = Company.find(params[:id])
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end
  
  def index
    @companies = Company.paginate(page: params[:page])
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :property, :introduction, :scale, :address, :founded_at, :keyword, :comment, :products, :team, :stage, :worktime)
  end
end
