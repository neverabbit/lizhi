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
      redirect_to @position # company_position_path(@company, @position)
    else
      render 'new'
    end
  end
  
  def edit
    @position = Position.find(params[:id])
    # @company = @position.company
  end
  
  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(position_params)
      redirect_to @position
    else
      render 'edit'
    end
  end
  
  def show
    # @company = Company.find(params[:company_id])
    # @position = @company.positions.find(params[:id])
    @position = Position.find(params[:id])
    @recommender = User.new
    @recommendee = User.new
    @recommendation = Recommendation.new
  end
  
  def index
    # @positions = Position.all
    @positions = Position.order('updated_at DESC').paginate(page: params[:page])
  end
  
  def destroy
    position = Position.find(params[:id])
    position.destroy
    flash[:success] = position.name + "已删除"
    redirect_to positions_url
  end
  
  def offline
    @position = Position.find(params[:id])
    @position.update_attributes(status: "下线")
    respond_to do |format|
      format.html { redirect_to @position }
      format.js 
    end
  end
  
  def online
    @position = Position.find(params[:id])
    @position.update_attributes(status: "上线")
    respond_to do |format|
      format.html { redirect_to @position }
      format.js 
    end
  end
  
  private
    def position_params
      params.require(:position).permit(:name, :bonus, :salary_top, :salary_bottom, :city, :district, :address, :department, :report_to, :education, :experience, :age_top, :age_bottom, :keyword, :demanding, :recommended, :interviewee, :entry, :responsibility, :requirement, :consultant, :status, :weixin_title, :weixin_desc)
    end
  
end
