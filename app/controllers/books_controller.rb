class BooksController < ApplicationController
#index action
get '/books' do
  if current_user
    @books = current_user.books
    erb :'books/index'
  else
    redirect 'login'
  end
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
    set_book
  if @book
    erb :'books/show'
  else
    redirect '/books' 
  end
end

#edit action(view for form that will update)
get '/books/:id/edit' do
  set_book
  erb :'books/edit'
end

#update action
patch '/books/:id' do
  params.delete(:_method)
  set_book
  @book.update(params)
  redirect '/books'
end

#delete action
delete '/books/:id' do
  set_book
  @book.destroy
  redirect "/books"
end

  private

  def set_book
    @book = current_user.books.find_by_id(params[:id])
  end
end