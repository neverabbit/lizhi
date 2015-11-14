class PositionsController < ApplicationController
  
  def new
    @company = Company.find(params[:company_id])
    @position = @company.positions.new
  end
  
  def create
    @position = Position.new(position_params)
    @position[:remaining] = @position[:demanding] - @position[:entry]
    # @position[:keyword] = @position[:keyword].split(' ')
    if @position.save
      redirect_to @position
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def show
    @position = Position.find(params[:id])
  end
  
  def index
  end
  
  def destroy
  end
  
  private
    def position_params
      params.require(:position).permit(:name, :bonus, :salary_top, :salary_bottom, :city, :district, :address, :department, :report_to, :education, :experience, :age_top, :age_bottom, :keyword, :demanding, :recommended, :interviewee, :entry, :responsibility, :requirement, :consultant, :status)
    end
  
end
