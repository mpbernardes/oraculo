class QuestionsController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    @question = Question.find(params[:id])
    respond_with(@question)
  end

  def new
    @question = current_user.questions.build
    respond_with(@question)
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def create
    @question = current_user.questions.new(params[:question])

#Convertendo o texto da resposta em HTML formatado
#INI

    body = @question.body
    body = BlueCloth.new(body).to_html
    @question.body = body

#FIM

    @question.save
    respond_with(@question)
  end

  def update
    @question = current_user.questions.find(params[:id])

#Convertendo o texto da resposta em HTML formatado
#INI

    body = params[:question]['body']
    body = BlueCloth.new(body).to_html
    params[:question]['body'] = body

#FIM

    @question.update_attributes(params[:question])
    respond_with(@question)
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy
    respond_with(@question)
  end
end
