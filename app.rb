require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    pigl = PigLatinizer.new
    @piglatin = pigl.piglatinize(params[:user_phrase])
    erb :results
  end

end