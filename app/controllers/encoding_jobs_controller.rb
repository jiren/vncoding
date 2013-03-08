class EncodingJobsController < ApplicationController
  before_filter :authenticate_user!
  # GET /encoding_jobs
  # GET /encoding_jobs.json
  def index
    @encoding_jobs = EncodingJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @encoding_jobs }
    end
  end

  # GET /encoding_jobs/1
  # GET /encoding_jobs/1.json
  def show
    @encoding_job = EncodingJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @encoding_job }
    end
  end

  # GET /encoding_jobs/new
  # GET /encoding_jobs/new.json
  def new
    @encoding_job = EncodingJob.new
    
    respond_to do |format|
      format.html {}
      #format.html { render text: 'abbb', layout: false}
      format.json { render json: @encoding_job }
    end
  end

  # GET /encoding_jobs/1/edit
  def edit
    @encoding_job = EncodingJob.find(params[:id])
  end

  # POST /encoding_jobs
  # POST /encoding_jobs.json
  def create
    @encoding_job = EncodingJob.new(params[:encoding_job])

    respond_to do |format|
      if @encoding_job.save
        format.html { redirect_to @encoding_job, notice: 'Encoding job was successfully created.' }
        format.json { render json: @encoding_job, status: :created, location: @encoding_job }
      else
        format.html { render action: "new" }
        format.json { render json: @encoding_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /encoding_jobs/1
  # PUT /encoding_jobs/1.json
  def update
    @encoding_job = EncodingJob.find(params[:id])

    respond_to do |format|
      if @encoding_job.update_attributes(params[:encoding_job])
        format.html { redirect_to @encoding_job, notice: 'Encoding job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @encoding_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encoding_jobs/1
  # DELETE /encoding_jobs/1.json
  def destroy
    @encoding_job = EncodingJob.find(params[:id])
    @encoding_job.destroy

    respond_to do |format|
      format.html { redirect_to encoding_jobs_url }
      format.json { head :no_content }
    end
  end
end
