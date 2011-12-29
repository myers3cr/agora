class MainController < ApplicationController
  def index
#    @messages = Message.current.order(:start_date)
#    @messages = Message.paginate page: params[:page], order: 'created_at desc', per_page: 10
    @messages = Message.current.paginate page: params[:page], order: 'start_date desc', per_page: 2
  end

end
