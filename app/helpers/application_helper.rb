module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Polltest"      
    end
  end
end
