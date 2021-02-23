class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :models, 'app/models'
    set :method_override, true
    set :bind, '0.0.0.0'
    #enable :static
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/:recipe/:id' do
    @recipe = Recipe.find_by_id(params[:id])
  erb :recipe
  end
  
  get '/create' do
    erb :create
  end

  get '/:recipe/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
    
  end


  post '/new_recipe' do
    @recipe = Recipe.new
    @recipe.title = params[:title]
    @recipe.description = params[:description]
    @recipe.ingredients = params[:ingredients]
    @recipe.directions = params[:directions]
    @recipe.save
   erb :recipe
  end
    
   post '/edit/:id' do
     @recipe = Recipe.find_by_id(params[:id])
     @recipe.update(title: params[:title], description: params[:description], ingredients: params[:ingredients], directions: params[:directions])
     @recipe.save
     redirect ':recipe/'+params[:id]
   end

   delete '/delete/:id' do
     @recipe = Recipe.find(params[:id])
     @recipe.destroy
     redirect '/'
   end

    end 
