CoderetreatLive::Application.routes.draw do
  resource :coderetreats, only: [] do
    get :running_today, on: :collection
    # get :edit_status, on: :member
    # put :update_status, on: :member

    resource :status, controller: 'coderetreats/status', only: [:edit, :update]
  end
end
