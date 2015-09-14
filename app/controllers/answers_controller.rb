class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new(question: @question)
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params.require(:answer).permit(:title, :body))
    @answer.question = @question
    @answer.user = User.last
    @answer.save

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully submitted.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

end