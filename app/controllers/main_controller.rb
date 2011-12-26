class MainController < ApplicationController
  def index
    @messages = Message.current
  end

end
