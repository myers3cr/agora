class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    # set defaults for form
    @default_bid_due = Time.now + 2.days
    @default_delivery_due = Time.now + 1.week
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to spec_path
    else
      render action: "new"
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to jobs_path, notice: "'#{@job.job_name}' was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url
  end

  private

  def spec_path 
    { :controller => "#{@job.spec_type}".pluralize, :action => "new", :id => @job.id }
  end
end
