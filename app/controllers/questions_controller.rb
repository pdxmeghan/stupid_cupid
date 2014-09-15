class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.valid?
      flash[:notice] = "Question submitted."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Question not submitted."
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question updated."
      redirect_to question_path(@question)
    else
      flash[:alert] = "Question not updated."
      render 'edit'
    end
  end

  def destory
    @question = Question.find(params[:id])
    question.destroy
    flash[:notice] = "Question deleted."
    redirect_to questions_path
  end

private
  def question_params
    params.require(:question).permit(:content, :user_id).merge(:user_id => current_user.id)
  end


end
end
