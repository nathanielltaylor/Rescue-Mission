require 'factory_girl'

FactoryGirl.define do

  factory :user do
    username "champ"
  end

  factory :question do
    title "how to use rails"
    body "how do i write code"
    user
  end
end
