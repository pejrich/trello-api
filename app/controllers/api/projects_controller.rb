class Api::ProjectsController < Api::ApiController
  def get_id
    @project_id = Project.where(token: params[:token]).first_or_create.id
    render :json => @project_id.to_json
  end

  def show
    @project = Project.find(params[:id])
    render :json => @project.to_json(:include => { :buckets => {:include => :tasks}})
  end

  def new
    @project = Project.create
    render :json => @project.to_json
  end

end