Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root "categories#index"

  resources :categories, only: %i[index] do
    member do
      get :start
    end
  end

  scope :quizzes do
    get "start/:category_id", to: "quizzes#start_quiz", as: :start_quiz
    get "question", to: "quizzes#show_question", as: :quiz_question
    post "answer", to: "quizzes#answer", as: :answer_quiz_question
    get "result",  to: "quizzes#result", as: :quiz_result
    get "perfect", to: "quizzes#result_perfect", as: :quiz_result_perfect
  end
end
