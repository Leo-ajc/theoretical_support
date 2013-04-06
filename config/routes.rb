SupportFu::Application.routes.draw do
  # Client Interface
  get 'new_client_ticket' => 'client_interfaces#new_ticket', :as => 'new_client_ticket'
  post 'create_client_ticket' => 'client_interfaces#create_ticket', :as => 'create_client_ticket'
  get 't/:serial_code' => 'client_interfaces#history', :as => 'ticket_history'
  # ---

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup'
  root :to => 'sessions#new'

  get 'open_tickets' => 'tickets#open_tickets', :as => 'open_tickets'
  get 'on_hold_tickets' => 'tickets#on_hold_tickets', :as => 'on_hold_tickets'
  get 'closed_tickets' => 'tickets#closed_tickets', :as => 'closed_tickets'
  get 'unassigned_tickets' => 'tickets#unassigned_tickets', :as => 'unassigned_tickets'

  match 'search/(:serial_code)' => 'search#search', :as => 'serial_code_search'

  #post "versions/:model/:id/revert" => "versions#revert", :as => "revert_version"
  post 'ticket/restore' => 'tickets#restore', :as => 'restore_ticket'
  get 'ticket/:id/versions' => 'tickets#versions', :as => 'ticket_versions'

  post 'response/:id/:timestamp/restore' => 'responses#restore', :as => 'restore_response'
  get 'response/:id/versions' => 'responses#versions', :as => 'response_versions'

  resources :users, :sessions, :password_resets, :clients, :tickets, :responses
end
