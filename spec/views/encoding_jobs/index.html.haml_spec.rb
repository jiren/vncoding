require 'spec_helper'

describe "encoding_jobs/index" do
  before(:each) do
    assign(:encoding_jobs, [
      stub_model(EncodingJob,
        :s3_url => "S3 Url",
        :status => "Status",
        :file => "File"
      ),
      stub_model(EncodingJob,
        :s3_url => "S3 Url",
        :status => "Status",
        :file => "File"
      )
    ])
  end

  it "renders a list of encoding_jobs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "S3 Url".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
