CreditLearning::Application.routes.draw do

  THEME_NAMES.each do |theme|

    match "#{theme}", to: "pages##{theme}", via: :get

  end

  root to: 'pages#default'

end