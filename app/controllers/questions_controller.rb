class QuestionsController < ApplicationController

  def index
    if params[:query]
      @questions = Question.basic_search(params[:query])
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end

  def create
    @question = Question.create(question_params)
    if @question.valid?
      flash[:notice] = "Question submitted."
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "Question not submitted."
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    # if @question.answers != nil
    #   @answers = @question.answers
    # end
  end

  def edit
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html {redirect_to question_path(@question)}
      format.js
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question updated."
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "Question not updated."
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question deleted."
    redirect_to questions_path
  end

private
  def question_params
    params.require(:question).permit(:content, :title, :user_id).merge(:user_id => current_user.id)
  end
end
