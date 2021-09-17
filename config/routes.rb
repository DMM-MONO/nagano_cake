Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
