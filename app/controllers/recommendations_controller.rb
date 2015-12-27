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
          @recommendation = @recommender
          respond_to do |format|
            format.html {redirect_to @recommendation}
            format.js and return
          end
        end
      end
      unless @recommendee = User.find_by(phone: safe_params[:recommendee_phone])
        @recommendee = User.new({name: safe_params[:recommendee_name], phone: safe_params[:recommendee_phone], password: safe_params[:recommendee_phone][6..11], password_confirmation: safe_params[:recommendee_phone][6..11]})
        unless @recommendee.save
          @recommendation = @recommendee
          # @recommendation.errors.messages.delete(:password) # error
          respond_to do |format|
            format.html {redirect_to @recommendation}
            format.js and return
          end
        end
      end
      recom_params = {recommender_id: @recommender.id, recommendee_id: @recommendee.id, position_id: safe_params[:position_id], comment: safe_params[:comment], status: status_params[0], stage: stage_params[0] }
      @recommendation = Recommendation.new(recom_params)
      if @recommendation.save
        send_sms(@recommendation, 1)
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
  
  def edit
    @recommendation = Recommendation.find(params[:id])
    @position = @recommendation.position
  end
  
  def update
    @recommendation = Recommendation.find(params[:id])
    status_orig = @recommendation.status
    stage_orig = @recommendation.stage
    if @recommendation.update_attributes(update_params)
      
      if stage_orig != stage_params[6] and @recommendation.stage == stage_params[6]
        @recommendation.update_attributes(status: status_params[1])
        # 入职金发放后的短信提醒
        send_sms(@recommendation, 4) 
      
      elsif status_orig == status_params[0] and @recommendation.status == status_params[1]
        # 推荐关闭后的短信提醒
        send_sms(@recommendation, 0)
      elsif stage_orig != stage_params[3] and @recommendation.stage == stage_params[3]
        # 候选人已面试后的短信提醒
        send_sms(@recommendation, 2)
      elsif stage_orig != stage_params[5] and @recommendation.stage == stage_params[5]
        send_sms(@recommendation, 3)
      else
      end
      redirect_to @recommendation
    else
      render 'edit'
    end
  end
  
  def show
    @recommendation = Recommendation.find(params[:id])
  end
  
  def index
    @recommendations = Recommendation.order('updated_at DESC').paginate(page: params[:page])
  end
  
  def destroy
  end
  
  private
    def safe_params
      params.permit(:recommender_name, :recommender_phone, :recommendee_name, :recommendee_phone, :comment, :status, :position_id, :stage, :history, :reason)
    end
    def update_params
      params.require(:recommendation).permit(:stage, :status, :comment, :reason)
    end
end
