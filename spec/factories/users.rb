FactoryBot.define do

  factory :user do
    id             {"1"}
    nickname       {"ryou"}
    first_name    {"川北"}
    last_name     {"亮"}
    kana_first_name {"カワキタ"}
    kana_last_name {"リョウ"}
    email           {"abc@gmail.com"}
    password            {"000000000"}
    encrypted_password  {"000000000"}
  end
end
