class Api::ProjectsController < Api::ApiController
  def get_id
    @project = Project.where(token: params[:token]).first_or_create
    render :json => @project.to_json(:include => { :buckets => {:include => :tasks}})
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