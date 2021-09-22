Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}

  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:edit, :create, :index, :update]
    resources :customers, only: [:index, :show, :edit, :update]

  end

  #URLにpublicを入れたくないためscope
  scope module: 'public' do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get   'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    resource  :customer,     only:[:show,:edit,:update]
    resources :shipping_addresses, only: [:index,:create,:edit,:update,:destroy]
  end

end
