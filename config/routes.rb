Rails.application.routes.draw do
  devise_for :users
  # get 'talks/test' => 'talks#test'
  root 'talks#top'
  
  resources :folders do
    collection do
      get 'search'
    end
    resources :talks
    collection do
      get 'talks/search' => 'talks#search'
    end
  end
  resources :flashcards
  
  # get 'folders/search' => 'folders#search'
  # get 'talks/search' => 'talks#search'
end

