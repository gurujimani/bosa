module ApplicationHelper
  
   def content_for(name, content = nil, &block)
    @has_content ||= {}
    @has_content[name] = true
    super(name, content, &block)
  end

  def has_content?(name)
    (@has_content && @has_content[name]) || false
  end
  
  def menu
    menu = navigation [:menu]
    #menu.html_safe
  end
  
end
