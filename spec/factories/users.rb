FactoryBot.define do

  factory :user do
    id                  {"1"}
    nickname            {Faker::Name.initials}
    last_name           {ForgeryJa(:name).last_name}
    first_name          {ForgeryJa(:name).first_name}
    kana_first_name     {ForgeryJa(:name).first_name(:to => ForgeryJa::KANA)}
    kana_last_name      {ForgeryJa(:name).last_name(:to => ForgeryJa::KANA)}
    email               {"abc@gmail.com"}
    password            {"00000000"}
    encrypted_password  {"00000000"}
    birth_date          {Faker::Date.birthday}
    uid                 {"12345"}
    provider            {"google"}
  end

  trait :invalid do
    email {nil}

  end
end
