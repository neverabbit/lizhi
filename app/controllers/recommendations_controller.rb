class RecommendationsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :delete, :index]
  
  def create
    @position = Position.find(params[:position_id])
    if logged_in?
      redirect_to @position
      # recommender = logged_in? ? current_user : User.find(params[:recommender_id])
#       recommendee = User.find(params[:recommendee_id])
    else
      # recommender_params = safe_params.permit(:recommender_name, :recommender_phone)
      # @recommender_params = recommender_params
      # @safe_params = params
      unless @recommender = User.find_by(phone: safe_params[:recommender_phone])
        @recommender = User.new({name: safe_params[:recommender_name], phone: safe_params[:recommender_phone], password: safe_params[:recommender_phone][6..11], password_confirmation: safe_params[:recommender_phone][6..11]})
        unless @recommender.save
          @recommendation_error = @recommender
          redirect_to @position
        end
      end
      unless @recommendee = User.find_by(phone: safe_params[:recommendee_phone])
        @recommendee = User.new({name: safe_params[:recommendee_name], phone: safe_params[:recommendee_phone], password: safe_params[:recommendee_phone][6..11], password_confirmation: safe_params[:recommendee_phone][6..11]})
        unless @recommendee.save
          @recommendation_error = @recommendee
          redirect_to @position
        end
      end
      recom_params = {recommender_id: @recommender.id, recommendee_id: @recommendee.id, position_id: safe_params[:position_id], comment: safe_params[:comment], status: safe_params[:status]}
      @recommendation = Recommendation.new(recom_params)
      if @recommendation.save
        # flash[:success] = "谢谢推荐!"
        respond_to do |format|
          format.html {redirect_to @recommendation}
          format.js
        end
      else
        respond_to do |format|
          format.html {redirect_to @recommendation}
          format.js
        end
      end 
    end    
  end
  
  def index
    @recommendations = Recommendation.paginate(page: params[:page])
  end
  
  def destroy
  end
  
  private
    def safe_params
      params.permit(:recommender_name, :recommender_phone, :recommendee_name, :recommendee_phone, :comment, :status, :position_id)
    end
end
