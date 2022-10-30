Rails.application.routes.draw do
  scope module: :api do
    post '/coupons/validate', to: 'coupons#validate'
  end
end
