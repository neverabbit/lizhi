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
      @position[:remaining] = @position[:demanding] - @position[:entry]
      @position.save
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
    @positions = Position.order('updated_at DESC').where("status LIKE ?", "上线").paginate(page: params[:page])
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
    @position.recommendations.each do |r|
      if r.status == status_params[0]
        r.update_attributes(status: status_params[1], reason: "职位已关闭")
        send_sms(r, 0)
      end
    end
    respond_to do |format|
      format.html { redirect_to @position }
      format.js 
    end
  end
  
  def online
    @position = Position.find(params[:id])
    @position.update_attributes(status: "上线")
    # @position.recommendations.each do |f|
#       f.update_attributes(status: status[0], reason: "职位已关闭")
#     end
    respond_to do |format|
      format.html { redirect_to @position }
      format.js 
    end
  end
  
  def search
    # store_location
    if params[:search_position].present?
      search_name = params[:search_position]
      redirect_to action: :results, search_position: search_name
    else
      redirect_to '/positions'
      # action: :index
    end
  end
  
  def results
    search_name = params[:search_position] 
    @positions = Position.order('created_at DESC').where("LOWER(name) LIKE ?", "%#{search_name.downcase}%").paginate(page: params[:page])
  end
  
  private
    def position_params
      params.require(:position).permit(:name, :bonus, :salary_top, :salary_bottom, :city, :district, :address, :department, :report_to, :education, :experience, :age_top, :age_bottom, :keyword, :demanding, :recommended, :interviewee, :entry, :responsibility, :requirement, :consultant, :status, :weixin_title, :weixin_desc)
    end
  
end
