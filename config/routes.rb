CoderetreatLive::Application.routes.draw do
  resource :coderetreats, only: [] do
    get :running_today, on: :collection
    get :edit_status, on: :member
  end
end
