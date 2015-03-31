require 'models/robot_manager'

class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotManager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    p @robot
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotManager.delete(id.to_i)
    redirect '/robots'
  end
end