FactoryBot.define do
  factory :votante do
    documento { generate :string_unico }
    nombre { generate :string_unico }
    titulo { generate :string_unico }
  end
end
