class PositionsController < ApplicationController
  include PositionsHelper
  
  before_action :logged_in_user, only: [:new, :edit, :update, :delete]
  
  def new
    @company = Company.find(params[:company_id])
    @position = @company.positions.new
  end
  
  def create
    @company = Company.find(params[:company_id])
    # @position = Position.new(position_params)
    # @position[:entry] = 0
    # @position[:remaining] = @position[:demanding]
    @position = @company.positions.build(position_params)
    @position[:entry] = 0
    @position[:recommended] = 0
    @position[:interviewee] = 0
    @position[:status] = '上线'
    @position[:remaining] = @position[:demanding]
    
    # @position[:keyword] = @position[:keyword].split(' ')
    if @position.save
      redirect_to company_position_path(@company, @position)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def show
    @company = Company.find(params[:company_id])
    @position = @company.positions.find(params[:id])

  end
  
  def index
    # @positions = Position.all
    @positions = Position.order('created_at DESC').paginate(page: params[:page])
  end
  
  def destroy
  end
  
  private
    def position_params
      params.require(:position).permit(:name, :bonus, :salary_top, :salary_bottom, :city, :district, :address, :department, :report_to, :education, :experience, :age_top, :age_bottom, :keyword, :demanding, :recommended, :interviewee, :entry, :responsibility, :requirement, :consultant, :status)
    end
  
end
