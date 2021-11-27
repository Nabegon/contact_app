Rails.application.routes.draw do
  resources :contacts
  get 'contacts/new', to: 'contacts#new', as: 'new'
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/thanks', to: 'contacts#thanks', as: 'thanks'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
