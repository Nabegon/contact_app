Rails.application.routes.draw do
  resources :contacts
  get 'contacts/index'
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/thanks', to: 'contacts#thanks', as: 'thanks'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
