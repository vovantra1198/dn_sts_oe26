FactoryBot.define do
  factory :course do
    name {Faker::Name.name}
    content {Faker::Lorem.word}
    location {Course.locations[:da_nang]}
    start_date {Date.new 1998, 11, 07}
    status {Course.statuses[:archive]}
    deleted {true}
  end

  factory :admin_course, class: Course do
    name {Faker::Name.name}
    content {Faker::Lorem.word}
    location {Course.locations[:da_nang]}
    start_date {Date.new 1998, 11, 07}
    status {Course.statuses[:archive]}
    deleted {true}
  end
end
