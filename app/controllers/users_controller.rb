class UsersController < ApplicationController
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do 
    user = User.new(params)
    session[:user_id] = user.id
    redirect '/books'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do 
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      redirect '/books'
    else
        @error = 'Invalid Login Information'
      erb :'users/login'
    end
  end

  delete '/logout' do 
    session.destroy
    redirect '/'
  end
end