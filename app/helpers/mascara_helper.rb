module MascaraHelper

  def markdown(text)
    BlueCloth.new(text).to_html.html_safe
  end
end


