FactoryBot.define do
  factory :lesson_class do
    title { "Test Title" }
    description { "Test Description" }
    category

    after(:build) do |lesson_class|
      lesson_class.background.attach(
        io: File.open("#{Rails.root}/app/assets/images/backgrounds/abstract-wallpaper.jpeg"),
        filename: 'background.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
