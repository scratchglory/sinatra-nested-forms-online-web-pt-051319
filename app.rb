require './environment'

module FormsLab
	class App < Sinatra::Base
		# code other routes/actions here
		get '/' do
			'Welcome to the Nested Forms Lab!'
		end
		get '/new' do
			erb :'pirates/new'
		end

		post '/pirates' do
			# returns 200 with passing args in the models
			@pirate = Pirate.new(params[:pirate])
			params[:pirate][:ships].each { |details| Ship.new(details) }
			@ships = Ship.all

			erb :'pirates/show'
		end
	end
end
