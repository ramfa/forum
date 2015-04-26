class TopicsController < ApplicationController
before_action :find_topic, only: [:show, :edit, :update, :destroy]
before_action :authenticate_admin!, only: [:new]

def index
  @topics=Topic.all
end

def show
 
end

def new
  @topic= Topic.new
end

def create
  @topic= Topic.new(topic_params)
  if @topic.save
    redirect_to @topic
  else
    render 'new'
  end
end

private

def topic_params
  params.require(:topic).permit(:title, :admin_id)
  
end
def find_topic
	@topic=Topic.find(params[:id])
	
end

end
