class UsersController < ApplicationController
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do 
   if !User.find_by(user_name: params[:user_name]) && params[:password] != ""
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/books'
   else
      @error = 'Invalid Username or Password'
      erb :'users/signup'
   end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do 
    user = User.find_by(user_name: params[:user_name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
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