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
  
  def commission(amount)
    @commissions = Commission.active
    @commissions.each do |commission|
      if @amount >= commission.from_amount && @amount <= commission.to_amount
        @result = commission.to_json
        @result_xml = commission.to_xml
      end
    end  
    
  end
  
  def charge(name)
    
  end
  
end
