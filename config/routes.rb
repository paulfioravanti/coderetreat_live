CoderetreatLive::Application.routes.draw do
  resource :coderetreats, only: [] do
    get :running_today, on: :collection
  end
end
