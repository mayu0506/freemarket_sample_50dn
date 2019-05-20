FactoryBot.define do

  factory :user do
    nickname       {"ryou"}
    first_name    {"川北"}
    last_name     {"亮"}
    kana_first_name {"カワキタ"}
    kana_last_name {"リョウ"}
    email           {"abc@gmail.com"}
    encrypted_password  {"00000000"}
  end
end
