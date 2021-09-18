Rails.application.routes.draw do

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
     resources :items

  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}
  #public
  get 'about' => 'public/homes#about'
  namespace :admin do
    resources :genres, only: [:edit, :create, :index, :update]
    resources :items
  
  end
end
