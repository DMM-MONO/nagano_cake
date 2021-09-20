Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations', only: [:cancel, :new, :update]
}

  namespace :admin do
    resources :genres, only: [:edit, :create, :index, :update]
  end

  #URLにpublicを入れたくないためscope
  scope module: 'public' do
    get 'about' => 'homes#about'
    get   'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    resource  :customer,     only:[:show,:edit,:update]
    resources :orders
    resources :shipping_addresses, only: [:index,:create,:edit,:update,:destroy]
  end
    
end
  