class GraduadosController < ApplicationController

  def index
    if params[:search].present?
      @graduados = Graduado.search_by_documento_or_nombre(params[:search])
    else
      @graduados = Graduado.all
    end
  end
end
