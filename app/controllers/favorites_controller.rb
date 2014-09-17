class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    if @answer.question.favorite
      @answer.question.favorite.destroy
    end
    @favorite = Favorite.create(:answer_id => @answer.id,  :user_id => current_user.id, :question_id => @answer.question.id)
    @question = @favorite.question
    if @favorite.valid?
      flash[:notice] = "Your favorite vote has been accepted"
      respond_to do |format|
        format.html { redirect_to question_path(@question)}
        format.js
      end
    end
  end
end
