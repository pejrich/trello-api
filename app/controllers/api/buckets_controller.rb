class Api::BucketsController < Api::ApiController
  
  def show
    @bucket = Bucket.find(params[:id])
    # render :json => @bucket.to_json(:include => { :tasks => {:only => [:id]}})
    render :json => @bucket.to_json(:include => :tasks)
  end

  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      render json: @bucket
    else
      render json: @bucket.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @bucket = Bucket.find(params[:id])
    if @bucket.update_attributes(bucket_params)
      render json: @bucket
    else
      render json: @bucket.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    bucket = Bucket.find(params[:id])
    if bucket.destroy
      render json: bucket, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  private

    def bucket_params
      params.require(:bucket).permit(:name, :project_id, :order)
    end
end
