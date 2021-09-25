Rails.application.routes.draw do
  
   scope module: 'public' do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get   'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer'
    patch 'withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    resource  :customers,     only:[:edit,:update]
    get 'customers/my_page' => 'customers#show', as: 'my_page_customer'
    resources :orders do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
     
    resources :shipping_addresses, only: [:index,:create,:edit,:update,:destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
  end

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
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders
 end

 

end
