FactoryGirl.define do

  factory :comment do
    text  Faker::Lorem.sentence
    user_id  "3"
    group_id  "3"
  end


end
