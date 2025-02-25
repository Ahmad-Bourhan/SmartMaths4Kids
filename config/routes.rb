Rails.application.routes.draw do
  resources :scores
  resources :questions
  resources :profiles
  devise_for :users
  get "home/index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index"

  # PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Questions stats
  get "questions/stats", to: "questions#stats"

  # Quiz routes
  get "quiz", to: "quizzes#index", as: "quiz" # Choose level
  post "quiz/start/:level", to: "quizzes#start", as: "quiz_start" # Start quiz for selected level
  get "quiz/questions", to: "quizzes#show_questions", as: "quiz_questions" # Show questions
  post "quiz/submit_all", to: "quizzes#submit_all", as: "quiz_submit_all"
  get "quiz/results", to: "quizzes#results", as: "quiz_results"
end
