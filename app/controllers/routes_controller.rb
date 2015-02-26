class RoutesController < ApplicationController
  def index
  	json_data = '[
 	{ "Timestamp": "24-02-2015 13:42:41", "Name": "TS_A10 8,150Re_AfritS114 Re_IJburglaan", "Velocity": 43, "Length": 1566, "Traveltime": 130 },
 	{ "Timestamp": "24-02-2015 13:42:42", "Name": "TS_A11 8,150Re_AfritS114 Re_IJburglaan", "Velocity": 44, "Length": 1567, "Traveltime": 131 },
 	{ "Timestamp": "24-02-2015 13:42:43", "Name": "TS_A12 8,150Re_AfritS114 Re_IJburglaan", "Velocity": 45, "Length": 1568, "Traveltime": 132 }
 	]'

 	@parsed_json = JSON.parse(json_data)
 	location = params[:name]
 	#@route = Route.new(timestamp: bla, name: bla, )
  	@route = Route.where(name: location)

  	render json: @route
  end

  def show
  	route = Route.find(params[:id])
  end

  def route_names
  	render json: Route.select(:name).uniq
  end

  def new
  	@route = Route.new
	
  end

  def create #opslaan nieuw route
		@route = Route.new(allowed_params)

		if @route.save
			redirect_to routes_path
		else
			render 'new'
		end
	end


	private 
		def allowed_params
			params.require(:route).permit(:timestamp, :name, :velocity, :length , :traveltime)
		end
end
