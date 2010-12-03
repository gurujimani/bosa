RPH::Navigation::Builder.config do |navigation|
  navigation.define :main do |menu|
    menu.item :CustomersController, :path  => :customers_path
    menu.item :AgentsController, :path  => :agents_path
    menu.item :CommissionsController, :path  => :commissions_path
    menu.item :CurrenciesController, :path  => :currencies_path
    menu.item :ExratesController, :path  => :exrates_path
    menu.item :OrdersController, :path  => :orders_path
  end
end
