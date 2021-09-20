Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations', only: [:cancel, :new, :update]
}
  get 'about' => 'public/homes#about'

  namespace :admin do
    resources :genres, only: [:edit, :create, :index, :update]
  end
  
  scope module: 'public' do
    get   'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    resource  :customer,     only:[:show,:edit,:update]
    resources :orders
  end
    
end
  
   #退会機能
  #get '/unsubscribe' => 'public/customers#unsubscribe', as: 'confirm_unsubscribe'
  #patch '/unsubscribe' => 'public/customers#withdraw', as: 'withdraw_customer'


