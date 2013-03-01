class EncodingJob
  include Mongoid::Document

  field :status, type: String
  field :file, type: String
  field :s3_url, type: String

end
