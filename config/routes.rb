Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}
  #public
  get 'about' => 'public/homes#about'

  namespace :admin do
    resources :genres, only: [:edit, :create, :index, :update]
  end
  
   #退会機能
  get '/unsubscribe' => 'public/customers#unsubscribe', as: 'confirm_unsubscribe'
  patch '/withdraw' => 'public/customers#withdraw', as: 'withdraw_customer'

end
