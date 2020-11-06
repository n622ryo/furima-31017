FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"111aaa"}
    password_confirmation {password}
    first_name            {"阿部"}
    last_name             {"直樹"}
    first_name_reading    {"アベ"}
    last_name_reading     {"ナオキ"}
    birthday              {"1996-1-1"}
  end
end