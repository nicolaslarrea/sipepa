FactoryBot.define do
  factory :padron do
    ano { generate :string_unico }
  end
end
