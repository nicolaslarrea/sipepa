require "test_helper"

describe Graduado do
  let(:graduado) { create :graduado }

  describe 'validaciones' do
    it 'requiere documento' do
      value(build(:graduado, documento: nil)).wont_be :valid?
    end

    it 'requiere nombre' do
      value(build(:graduado, nombre: nil)).wont_be :valid?
    end

    it 'requiere ano' do
      value(build(:graduado, titulo: nil)).wont_be :valid?
    end

    it 'tiene un valor unico para documento' do
      existente = create(:graduado)
      value(build(:graduado, documento: existente.documento)).wont_be :valid?
    end

    it 'tiene una única asociación a user' do
      existente = create(:graduado, :asociado_a_user)
      value(build(:graduado, user_id: existente.user_id)).wont_be :valid?
    end
  end

  describe 'relaciones destroy' do
    it 'destruye empadronamiento al borrar graduados' do
      graduado = create(:empadronamiento).graduado

      value(-> { graduado.destroy }).must_differ 'Empadronamiento.count', -1
    end
  end
end
