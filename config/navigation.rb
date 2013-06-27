SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'current'
  navigation.items do |primary|
    primary.dom_id = 'navigation_bar'
    primary.item :menu_transactions, 'Transactions', transactions_path
    primary.item :menu_flatmates, 'Flatmates', flatmates_path
    primary.item :menu_flatmate_groups, 'Flatmate Groups', flatmate_groups_path
  end
end
