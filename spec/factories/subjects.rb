FactoryBot.define do
  factory :subject do
    name {Faker::Name.name}
    details {Faker::Lorem.word}
    duration_default {Faker::Number.digit}
    deleted {true}
  end

  factory :admin_subject, class: Subject do
    name {Faker::Name.name}
    details {Faker::Lorem.word}
    duration_default {Faker::Number.digit}
    deleted {true}
  end
end
