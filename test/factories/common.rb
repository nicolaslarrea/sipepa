# Métodos generales y helpers para factories.
FactoryBot.define do
  # Genera un string único.
  sequence :string_unico, 'a'

  # Genera un email random.
  sequence(:email) do |n|
    "email-#{n}@ejemplo.com"
  end
end
