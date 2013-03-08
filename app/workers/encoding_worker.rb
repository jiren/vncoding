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
      movie.screenshot("#{encoding_job.output_file_dir}screenshot.bmp", seek_time: 5, resolution: '320x240')
      p '-----------------------1'
      encoding_job.state = EncodingJob::STATES[:complete]
      encoding_job.encoded_video_path = encoding_job.output_file_name
      encoding_job.image_path = "#{encoding_job.output_file_dir}screenshot.bmp"
    rescue Exception => e
      encoding_job.state = EncodingJob::STATES[:error]
      encoding_job.error = e.message
    end

      p '-----------------------2'
    encoding_job.save
      p '-----------------------3'
      p encoding_job
  end
end
