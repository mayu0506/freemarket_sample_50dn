FactoryBot.define do

  factory :address do
    id               {"1"}
    postcode         {"111-1111"}
    prefecture_code  {"20"}
    city             {"新宿区新宿"}
    street           {"２−８−１"}
    user_id          {"1"}

    trait :invalid do
      postcode {nil}
    end
  end

end
