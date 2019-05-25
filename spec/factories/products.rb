FactoryBot.define do

  factory :product do
    id                  {1}
    name                {"Deuxieme Classe☆ＯRIVAストライプワイドパンツ"}
    description         {"説明文"}
    price               {"123456"}
    condition           {1}
    status              {"selling"}
    who_to_pay          {1}
    origin_of_delivery  {1}
    size                {"150"}
    buyer_id             {"null"}
    user_id             {"1"}
    category_id         {24}
    deliverying_date    {1}
  end
end
