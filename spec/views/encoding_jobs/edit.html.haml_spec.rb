require 'spec_helper'

describe "encoding_jobs/edit" do
  before(:each) do
    @encoding_job = assign(:encoding_job, stub_model(EncodingJob,
      :s3_url => "MyString",
      :status => "MyString",
      :file => "MyString"
    ))
  end

  it "renders the edit encoding_job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", encoding_job_path(@encoding_job), "post" do
      assert_select "input#encoding_job_s3_url[name=?]", "encoding_job[s3_url]"
      assert_select "input#encoding_job_status[name=?]", "encoding_job[status]"
      assert_select "input#encoding_job_file[name=?]", "encoding_job[file]"
    end
  end
end
