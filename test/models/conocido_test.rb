require "test_helper"

describe Conocido do
  let(:conocido) { create :conocido }

  describe 'validaciones' do
    it 'requiere un user' do
      value(build(:conocido, user_id: nil)).wont_be :valid?
    end

    it 'requiere un votante' do
      value(build(:conocido, votante_id: nil)).wont_be :valid?
    end

    it 'no puede tenerla misma convinación de votante y user' do
      existente = create(:conocido)
      value(build(:conocido, user_id: existente.user_id, votante_id: existente.votante_id)).wont_be :valid?
    end
  end
end
