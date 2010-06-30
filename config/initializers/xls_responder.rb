ActionController::Renderers.add :xls do |object, options|
	self.send_data obect.to_xls_data, :type => :xls
end
