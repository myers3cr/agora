class MainController < ApplicationController
  def index
    @messages = Message.current.paginate page: params[:page], order: 'start_date desc', per_page: 2
  end

end
