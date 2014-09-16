class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    respond_to do |format|
      format.html { redirect_to question_answers_path }
      format.js
    end
  end

  def create
    @answer = Answer.create(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.valid?
      flash[:notice] = "Answer has been submitted"
      respond_to do |format|
        format.html {redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "Answer not submitted"
      redirect_to question_path(@question)
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer updated."
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "Answer not updated."
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer deleted"
      respond_to do |format|
      format.html {  redirect_to questions_path }
      format.js
    end
  end

private
  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :content).merge(:user_id => current_user.id)
  end
end
