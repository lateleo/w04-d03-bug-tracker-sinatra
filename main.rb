require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"
require "pry"
require_relative "lib/insect.rb"
require_relative "lib/researcher.rb"
require_relative "lib/paper.rb"
require_relative "lib/location.rb"

get '/' do
  binding.pry
end

get '/index' do
  erb :index
end
#### INSECTS

# Index
get '/insects_index' do
  @insects = Insect.all
  erb :insects_index
end

# New
get '/insects/new' do
  @insect = Insect.new
  erb :insects_new
end

# Create
post '/insects/new' do
  # create insect object
  @insect = Insect.new(params)
  @insect.save ? redirect('/insects_index') : (erb :insects_new)
end

# Show
get '/insects/:id' do
  @insect = Insect.find_by_id(params['id']) # nil or Insect object
  erb :insects_show
end

#### RESEARCHERS

# Index
get '/researchers_index' do
  @researchers = Researcher.all
  erb :researchers_index
end

# New
get '/researchers/new' do
  @researcher = Researcher.new
  erb :researchers_new
end

# Create
post '/researchers/new' do
  @researcher = Researcher.new(params)
  @insect.save ? redirect('researchers_index') : (erb :researchers_new)
end

# Show
get '/researchers/:id' do
  @researcher = Researcher.find_by_id(params['id'])
  erb :researchers_show
end

#### LOCATIONS

# Index
get '/locations_index' do
  @locations = Location.all
  erb :locations_index
end

# New
get '/locations/new' do
  @location = Location.new
  erb :locations_new
end

# Create
post '/locations/new' do
  @location = Location.new(params)
  @insect.save ? redirect('locations_index') : (erb :locations_new)
end

# Show
get '/locations/:id' do
  @location = Location.find_by_id(params['id'])
  erb :locations_show
end
