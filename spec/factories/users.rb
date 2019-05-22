FactoryBot.define do

  factory :user do
    nickname            {"ryou"}
    first_name          {"川北"}
    last_name           {"亮"}
    kana_first_name     {"カワキタ"}
    kana_last_name      {"リョウ"}
    email               {"abc@gmail.com"}
    password            {"00000000"}
    encrypted_password  {"00000000"}
    birth_date          {"1999/1/1"}
    uid                 {"12345"}
    provider            {"google"}
  end

  trait :invalid do
    email {nil}
  end
end
