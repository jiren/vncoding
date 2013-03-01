class EncodingWorker
  include Sidekiq::Worker

  sidekiq_options :timeout => 60, :retry => false, :backtrace => true
    

  def perform(encoding_job_id)
    encoding_job = EncodingJob.find(encoding_job_id)

    movie = FFMPEG::Movie.new(encoding_job.video.path)

    begin
      encoding_job.state = EncodingJob::STATES[:inprocess]
      encoding_job.save

      movie.transcode(encoding_job.output_file_name)
      encoding_job.state = EncodingJob::STATES[:complete]
    rescue Exception => e
      encoding_job.state = EncodingJob::STATES[:error]
      encoding_job.error = e.message
    end

    encoding_job.save

  end
end
