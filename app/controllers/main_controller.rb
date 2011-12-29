class MainController < ApplicationController
  def index
    @messages = Message.current.order(:start_date)
  end

end
