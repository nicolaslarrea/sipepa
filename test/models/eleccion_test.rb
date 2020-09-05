require 'test_helper'

describe Eleccion do
  let(:eleccion) { create :eleccion }

  describe 'validaciones' do
    it 'requiere ano' do
      value(build(:eleccion, ano: nil)).wont_be :valid?
    end

    it 'tiene un valor unico para ano' do
      existente = create(:eleccion)
      value(build(:eleccion, ano: existente.ano)).wont_be :valid?
    end
  end
end
