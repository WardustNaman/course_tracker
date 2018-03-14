class Api::V1::ClientsController < Api::V1::ApiController 

	def index
		@clients = Client.all
		render json: @clients
	end

	def create
    	@client = Client.new(client_params)
		if @client.save
			render json: @client
		else
			render json: { errors: @client.errors.full_messages, reason: "validations failed"}
		end
	end
	def show
		@client = Client.find(params[:id])
		render json: @client
	end
	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		render json: {
			notice: "Successfully deleted the client",
			client: {id: @client.id,
				name: @client.name}
		}
	end
	def update 
		@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
			render json: {
				notice: "Successfully Updated",
				client: @client
			}
		else
			render json: {
				errors: @client.errors.full_messages,
				reason: "validations failed"
			}
		end
	end

	private 

	def client_params
		params[:client].permit(:name, :email, :company)
	end

end