class BooksController < ApplicationController
#index action
get '/books' do
  @books = current_user.books
  erb :'books/index'
end

#new action(view for form that will create)
get '/books/new' do
  erb :'books/new'
end
#create action
post '/books' do
  book = current_user.books.build(params)
  book.complete = false
  book.save
  redirect "books/#{book.id}"
end
#show action
get '/books/:id' do
  @book = current_user.books.find_by_id(params[:id])
  if @book
    erb :'books/show'
  else
    redirect '/books' 
  end
end
#edit action(view for form that will update)

#update action

#delete action
end