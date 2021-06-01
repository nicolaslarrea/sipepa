# Funciones auxiliares para las vistas de Graduados.
module GraduadosHelper
  def filtro_graduado_busqueda_documentos_tag
    filtro_busqueda_tag key: 'busqueda_documentos',
      value: busqueda_documentos_actual,
      url: graduados_path,
      label: 'Documento'
  end
end
