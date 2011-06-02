module ApplicationHelper
  
  def master_class( params )
    "current" if params[:controller].match /^master/
  end
end
