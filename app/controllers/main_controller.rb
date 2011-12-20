class MainController < ApplicationController
  def index
    @messages = Message.last(3)
  end

end
