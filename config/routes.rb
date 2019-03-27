Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :user, :todo, :list
      post '/matches', to: 'user#matches'
      delete '/destroy_selected/:details', to: 'list#destroy_selected'
      post '/todo/:details', to: 'todo#create'
    end
  end
end
