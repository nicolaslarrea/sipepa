require "test_helper"

describe Empadronamiento do
  let(:empadronamiento) { create :empadronamiento }

  describe 'validaciones' do
    it 'requiere eleccion' do
      value(build(:empadronamiento, eleccion_id: nil)).wont_be :valid?
    end

    it 'requiere votante' do
      value(build(:empadronamiento, votante_id: nil)).wont_be :valid?
    end

    it 'tiene una combinación única de eleccion y votante' do
      existente = create(:empadronamiento)

      value(build(:empadronamiento, eleccion_id: existente.eleccion.id)).must_be :valid?
      value(build(:empadronamiento, votante_id: existente.votante.id)).must_be :valid?
      value(build(:empadronamiento, eleccion_id: existente.eleccion.id, votante_id: existente.votante.id)).wont_be :valid?
    end
  end
end
