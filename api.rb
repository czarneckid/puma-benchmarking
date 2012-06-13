require 'grape'
require 'securerandom'

module PumaBenchmark
  class API < Grape::API    
    format :json

    resource :health do
      get '/ping' do
        {:status => 'ok', :data => 'pong'}
      end
    end

    resource :random do
      get '/value' do
        {:status => 'ok', :data => SecureRandom.hex}
      end
    end
  end
end