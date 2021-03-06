FactoryBot.define do
  factory :graduado do
    documento { generate :string_unico }
    nombre { generate :string_unico }
    titulo { generate :string_unico }

    trait :asociado_a_user do
      user
    end
  end
end
