# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bosa::Application.initialize!

Formtastic::SemanticFormBuilder.send(:include, Formtastic::DatePicker)