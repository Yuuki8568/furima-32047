FactoryBot.define do
  factory :item do
    name                     {"佐藤太郎"}
    price                    {300}
    description              {"佐藤太郎作品"}
    condition_id             {1}
    category_id              {1}
    shipping_area_id         {1}
    postage_type_id          {1}
    preparation_day_id       {1}
    association              :user
     

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
   
  end
end
