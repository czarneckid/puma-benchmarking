require 'grape'

module PumaBenchmark
  class API < Grape::API    
    format :json

    resource :health do
      get '/ping' do
        {:status => 'ok', :data => 'pong'}
      end
    end
  end
end