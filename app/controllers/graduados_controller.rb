class GraduadosController < ApplicationController

  has_scope :con_nombre, only: [:index], as: :nombre
  has_scope :con_documento, only: [:index], as: :documento

  helper_method :busqueda_documentos_actual

  def index
    if params[:search].present?
      @graduados = Graduado.search_by_documento_or_nombre(params[:search])
    else
      @graduados = Graduado.all
    end
  end

  private

  def busqueda_documentos_actual
    params[:busqueda_documentos]
  end

  def graduado_params
  params.require(:graduado).permit(:documento, :nombre, :carrera)
  end
end
