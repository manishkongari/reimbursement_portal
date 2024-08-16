Rails.application.routes.draw do
  devise_for :users
  resources :employees
  resources :bills do
    member do
      patch :approve
      patch :reject
    end
    # Use the collection route if you need a custom route for viewing all bills
    # collection do
    #   get :view_all
    # end
  end
  
  resources :departments
  get 'view_submitted_bills', to: 'bills#index'
  get 'view_all_bills', to: 'bills#view_all'
  root 'home#index'
end
