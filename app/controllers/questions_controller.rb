class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = User.first
    @question.save

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { redirect_to new_question_path, notice: 'Please fill in both fields'}
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def update
    @question = Question.find(params[:id])
    # redirect_to question_path(params[:id])

    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
      else
        format.html { redirect_to new_question_path, notice: 'Please fill in both fields'}
      end
    end

  end

  def edit
    @question = Question.find(params[:id])
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
