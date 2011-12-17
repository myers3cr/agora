class MainController < ApplicationController
  def index
    @message = Message.last
  end

end
