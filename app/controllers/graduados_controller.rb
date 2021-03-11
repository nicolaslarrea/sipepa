class GraduadosController < ApplicationController

  def index
    @graduados = Graduado.all
  end
end
