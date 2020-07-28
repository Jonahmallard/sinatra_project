class BooksController < ApplicationController
#index action
get '/books' do
  @books = current_user.books
  erb :'books/index'
end

#new action(view for form that will create)

#create action

#show action

#edit action(view for form that will update)

#update action

#delete action
end