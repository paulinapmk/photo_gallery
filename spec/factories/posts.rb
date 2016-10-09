FactoryGirl.define do
  factory :post do
    title "title for post"
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/images/coffee.jpg', 'image/jpg')
    user_id 1
  end
end