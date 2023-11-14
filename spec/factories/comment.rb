FactoryBot.define do
  factory :comment do
    description { "Test Description" }
    lesson
    user
  end
end