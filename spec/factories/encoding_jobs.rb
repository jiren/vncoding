# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :encoding_job do
    s3_url "MyString"
    status "MyString"
    file "MyString"
  end
end
