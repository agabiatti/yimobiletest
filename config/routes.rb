Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :event
      resources :comment
      get :reported_comments, to: 'comment#reported_comments', as: :reported_comments
      get :without_comment_reported, to: 'comment#without_comment_reported', as: :without_comment_reported
      resources :user
      resources :report
    end
  end
end
