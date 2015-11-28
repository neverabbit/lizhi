class RecommendationsController < ApplicationController
  
  def create
    recommender = logged_in? ? current_user : User.find(params[:recommender_id])
    recommendee = User.find(params[:recommendee_id])
    position = Position.find(params[:position_id])
    
  end
  
  def destroy
  end
end
