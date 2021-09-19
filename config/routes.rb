Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}

  namespace :admin do
    resources :genres, only: [:edit, :create, :index, :update]
  end

#URLにpublicを入れたくないためscope
  scope module: :public do
    get 'about' => 'homes#about'
    resources :shipping_addresses, only: [:index,:create,:edit,:update,:destroy]
  end
  
end
