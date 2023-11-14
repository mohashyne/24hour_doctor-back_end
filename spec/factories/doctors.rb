# spec/factories/doctors.rb

FactoryBot.define do
  factory :doctor do
    name { 'Dr. Smith' }
    specialty { 'Cardiology' }
  end
end
