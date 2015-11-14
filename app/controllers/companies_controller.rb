class CompaniesController < ApplicationController
  include CompaniesHelper
  
  def new
    @company = Company.new
  end
  
  def create 
    @company = Company.new(company_params)
    if @company.save
      render @company
      # respond_to do |format|
#         format.html { redirect_to new_company_path }
#         format.js
#       end
    else
      render 'new'
      # respond_to do |format|
#         format.html { redirect_to new_company_path }
#         format.js
#       end
      # render 'new'
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
    params.require(:company).permit(:name, :property, :introduction, :scale, :address, :founded_at, :keyword, :comment, :products, :team, :stage)
  end
end
