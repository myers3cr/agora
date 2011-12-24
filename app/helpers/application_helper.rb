module ApplicationHelper
  
  def legend
    controller.action_name.capitalize + " " + controller.controller_name.singularize.capitalize
  end
  
end
