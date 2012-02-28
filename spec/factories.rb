FactoryGirl.define do

  factory :user do
    # TODO use sequence generators
    login "jamiew"
    email "jamie@jamiedubs.com"
    password "secret"
    password_confirmation "secret"
  end

end

