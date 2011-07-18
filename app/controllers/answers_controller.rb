class AnswersController < ApplicationController

  def create
    @answer   = Answer.new(params[:answer])
    @answer.owner = current_user
    @answer.question = Question.find(params[:question_id])
#Convertendo o texto da resposta em HTML formatado
#INI

    body = @answer.body
    body = BlueCloth.new(body).to_html
    @answer.body = body

#FIM
    @answer.save
    respond_with(@answer, location: @answer.question)
  end

end
