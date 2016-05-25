FactoryGirl.define do
  factory :user do
    name { FFaker::Internet.user_name }
    email { FFaker::Internet.disposable_email }
    password { FFaker::Internet.password  }
    api_key { SecureRandom.base64.tr('+/=', 'Qrt') }
  end
end
