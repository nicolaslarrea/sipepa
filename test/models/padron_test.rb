require 'test_helper'

describe Padron do
  let(:padron) { create :padron }

  describe 'validaciones' do
    it 'requiere ano' do
      value(build(:padron, ano: nil)).wont_be :valid?
    end

    it 'tiene un valor unico para ano' do
      existente = create(:padron)
      value(build(:padron, ano: existente.ano)).wont_be :valid?
    end
  end
end
