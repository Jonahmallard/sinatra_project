class BooksController < ApplicationController
#index action
get '/books' do
    redirect_if_not_logged_in
    @books = current_user.books
    erb :'books/index'
end

#new action(view for form that will create)
get '/books/new' do
    redirect_if_not_logged_in
    erb :'books/new'
end

#create action
post '/books' do
  if params[:book] != ""
    book = current_user.books.build(params)  
    book.complete = false
    book.save
    redirect "books/#{book.id}"
  else
    erb :'books/new'
  end
end

#show action
get '/books/:id' do 
    redirect_if_not_logged_in
    if set_book
      erb :'books/show'
    else
      redirect '/books'
    end
end

#edit action(view for form that will update)
get '/books/:id/edit' do
  redirect_if_not_logged_in
  if set_book
    erb :'books/edit'
  else
    redirect '/books'
  end
end

#update action
patch '/books/:id' do
  set_book
  if params[:book] != ""
    params.delete(:_method)
    @book.update(params)
    redirect '/books'
  else
    erb :'books/edit'
  end 
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