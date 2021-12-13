FactoryBot.define do
  factory :group do
    group_name            { Faker::Name.initials(number: 2) }
    password              { 'aaa111' }
    password_confirmation { password }
  end
end
