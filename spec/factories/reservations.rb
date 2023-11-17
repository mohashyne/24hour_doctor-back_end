# spec/factories/reservations.rb

FactoryBot.define do
  factory :reservation do
    date { Time.now + 1.day }
    city { 'Sample City' }
    association :user
    association :doctor, factory: :doctor
  end
end
