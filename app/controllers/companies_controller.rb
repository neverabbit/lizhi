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
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def show 
    @company = Company.find(params[:id])
    @positions = @company.positions.order('created_at DESC').paginate(page: params[:page])
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
  
  def destroy
    company = Company.find(params[:id])
    resume.remove_logo_file!
    company.destroy
    flash[:success] = company.realname + "公司已删除"
    redirect_to companies_url
  end
  
  private
  
  def company_params
    params.require(:company).permit(:realname, :name, :property, :introduction, :scale, :address, :founded_at, :keyword, :comment, :products, :team, :stage, :worktime, :logo_file)
  end
end
