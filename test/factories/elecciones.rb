FactoryBot.define do
  factory :eleccion do
    ano { generate :string_unico }
  end
end
