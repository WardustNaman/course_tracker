class Api::V1::ProjectsController < Api::V1::ApiController

	def index
		@projects = Project.all
		render json: @projects
	end

	def create
    	@project = Project.new(project_params)
		if @project.save
			render json: @project
		else
			render json: { errors: @project.errors.full_messages, reason: "validations failed"}
		end
	end

	def show
		@project = Project.find(params[:id])
		render json: {
			id: @project.id,
			name: @project.name,
			client: @project.client.name,
			status: @project.status,
			start_date: @project.start_date
		}
	end
	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		render json: {
			notice: "Successfully deleted the client",
		}
	end
	def update 
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			render json: {
				notice: "Successfully Updated",
				project: @project
			}
		else
			render json: {
				errors: @project.errors.full_messages,
				reason: "validations failed"
			}
		end
	end


	private 

	def project_params
		params[:project].permit(:name, :status, :client_id, :start_date)
	end

end