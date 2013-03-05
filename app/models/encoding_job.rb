class EncodingJob
  include Mongoid::Document
  include Mongoid::Paperclip

  STATES = { 
    'inqueue'   => 0,
    'inprocess' => 1,
    'complete'  => 2,
    'error'     => 3
  }

  field :request_id
  field :state, type: Integer, :default => 0
  field :callback_url
  field :video_url
  field :error
  field :format, :default => '.flv'
  field :s3_url

  has_mongoid_attached_file :video

  OUT_DIR = '/home/rishi/work/vncoding/public/system'

  after_create {|doc| EncodingWorker.perform_async(doc.id.to_s) }

  def output_file_name
    file_name = video_file_name.gsub(File.extname(video_file_name), '')
    "#{OUT_DIR}/#{file_name}#{format}"
  end

end
