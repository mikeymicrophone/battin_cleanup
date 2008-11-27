# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_name obj, method = nil
    unless method
      link_to obj.name, obj, :class => 'name'
    else
      link_to obj.send(method), obj, :class => 'name'
    end
  end
end
