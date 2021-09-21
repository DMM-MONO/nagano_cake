Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}
  #public
  
  scope module: :public do
  get 'about' => 'public/homes#about'
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end
end

  namespace :admin do
    resources :genres, only: [:edit, :create, :index, :update]
    resources :items

  end
  
   #退会機能
  get '/unsubscribe' => 'public/customers#unsubscribe', as: 'confirm_unsubscribe'
  patch '/withdraw' => 'public/customers#withdraw', as: 'withdraw_customer'

end
