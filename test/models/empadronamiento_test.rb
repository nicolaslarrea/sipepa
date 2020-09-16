require "test_helper"

describe Empadronamiento do
  let(:empadronamiento) { create :empadronamiento }

  describe 'validaciones' do
    it 'requiere eleccion' do
      value(build(:empadronamiento, eleccion_id: nil)).wont_be :valid?
    end

    it 'requiere graduado' do
      value(build(:empadronamiento, graduado_id: nil)).wont_be :valid?
    end

    it 'tiene una combinación única de eleccion y graduado' do
      existente = create(:empadronamiento)

      value(build(:empadronamiento, eleccion_id: existente.eleccion.id)).must_be :valid?
      value(build(:empadronamiento, graduado_id: existente.graduado.id)).must_be :valid?
      value(build(:empadronamiento, eleccion_id: existente.eleccion.id, graduado_id: existente.graduado.id)).wont_be :valid?
    end
  end
end
