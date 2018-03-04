FactoryBot.define do
  sequence(:email) { |n| "test#{n}@example.com" }
  sequence(:name) { |n| "#{n}ame" }
  sequence(:first_name) { |n| "#{n}ohn" }
  sequence(:last_name) { |n| "#{n}oe" }

  factory :user do
    email
    first_name
    last_name
    password "password"
    password_confirmation "password"
  end

  factory :team do
    name
    # captain
  end

  factory :event do
    start_date "2018-03-01"
    end_date "2018-03-04"
    name
  end

  factory :tournament do
    # event
    # division
  end

  factory :division do
    name "Division 4 X-Ball"
  end

  factory :entry do
    # team
    # tournament
  end

  factory :user_entry do
    # user
    # entry
  end

  factory :match do
    # home_team
    # away_team
    home_score 3
    away_score 2
  end

  factory :field do
    # event
    name
  end

  factory :timeslot do
    # field
    start_time "2018-03-03 14:15:00"
    end_time "2018-03-03 15:00:00"
  end
end
