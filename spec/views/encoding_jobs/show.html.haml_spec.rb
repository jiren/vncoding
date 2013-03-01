require 'spec_helper'

describe "encoding_jobs/show" do
  before(:each) do
    @encoding_job = assign(:encoding_job, stub_model(EncodingJob,
      :s3_url => "S3 Url",
      :status => "Status",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/S3 Url/)
    rendered.should match(/Status/)
    rendered.should match(/File/)
  end
end
