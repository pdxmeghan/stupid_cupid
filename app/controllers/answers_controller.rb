class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)
    @question = Question.find(parans[:question_id])
    if @answer.valid?
      flash[:notice] = "Answer has been submitted"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Answer not submitted"
      render 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer updated."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Answer not updated."
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer deleted"
    redirect_to questions_path
  end

private
  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :content).merge(:user_id => current_user.id)
end
