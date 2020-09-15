require "test_helper"

describe Votante do
  let(:votante) { create :votante }

  describe 'validaciones' do
    it 'requiere documento' do
      value(build(:votante, documento: nil)).wont_be :valid?
    end

    it 'requiere nombre' do
      value(build(:votante, nombre: nil)).wont_be :valid?
    end

    it 'requiere ano' do
      value(build(:votante, titulo: nil)).wont_be :valid?
    end

    it 'tiene un valor unico para documento' do
      existente = create(:votante)
      value(build(:votante, documento: existente.documento)).wont_be :valid?
    end

    it 'tiene una única asociación a user' do
      existente = create(:votante, :asociado_a_user)
      value(build(:votante, user_id: existente.user_id)).wont_be :valid?
    end
  end
end
