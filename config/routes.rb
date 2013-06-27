Wgtool::Application.routes.draw do
  resources :flatmate_groups

  resources :group_transactions

  resources :flatmates

  resources :transactions

  root :to => "transactions#index"
end
