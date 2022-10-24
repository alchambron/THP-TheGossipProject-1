require 'gossip'

# Creating a class to call the base of Sinatra
class ApplicationController < Sinatra::Base
  # Initialisation of the landing page
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  # Initialisation of the Adding Gossips Page
  get '/gossips/new/' do
    erb :new_gossip
  end

  # Returning to the database the result of the form
  post '/gossips/new/' do
    Gossip.new("#{params['gossip_author']}", "#{params['gossip_content']}").save
    redirect '/'
  end

  # Creation of the page to access to a specific gossip
  get '/gossips/:id/' do
    erb :show, locals: { gossip: Gossip.find(params['id'].to_i), id: params['id'] }
  end
end
