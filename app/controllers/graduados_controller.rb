class GraduadosController < ApplicationController

  helper_method :busqueda_documento_o_nombre_actual

  def index
    if params[:busqueda].present?
      @graduados = Graduado.buscar_por_documento_o_nombre(params[:busqueda])
    else
      @graduados = Graduado.all
    end
  end

  # Para búsqueda binaria de graduados por documento.
  def busqueda
    @eleccion_actual = Eleccion.last.ano
    @buscado = params[:search]
    #Quita los "." de los números que se buscan.
    @graduado = Eleccion.last.graduados.search(params[:search]&.tr('.', ''))
  end

  private

  def busqueda_documento_o_nombre_actual
    params[:busqueda]
  end

  def graduado_params
  params.require(:graduado).permit(:documento, :nombre, :carrera, :search)
  end
end
