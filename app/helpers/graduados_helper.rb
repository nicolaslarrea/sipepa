# Funciones auxiliares para las vistas de Graduados.
module GraduadosHelper
  def filtro_graduado_por_documento_o_nombre_tag
    filtro_busqueda_tag key: 'busqueda',
      value: busqueda_documento_o_nombre_actual,
      url: graduados_path,
      label: 'Documento'
  end
end
