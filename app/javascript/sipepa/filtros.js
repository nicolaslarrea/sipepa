// Al seleccionar un filtro o escribir un caracter en un input de texto, volver
// a pedir la página con Turbolinks aplicando esa búsqueda.
$(document).on('change input', '.select-filtro', function() {
  // Pedir los parámetros actuales.
  const params = new URLSearchParams(window.location.search)
  // Seleccionar el elemento.
  const filtro = $(this)

  // Si hay un valor seleccionado, agregarlo, en caso contrario sacar el
  // parámetro (funciona cuando elegimos el prompt).
  if (this.value) {
    params.set(filtro.data('key'), this.value)
  } else {
    params.delete(filtro.data('key'))
  }

  query_url = filtro.data('url')
  query_params = params.toString()

  // Filtrar strings vacíos antes del join.
  query = [query_url, query_params].filter(Boolean).join('?')

  Turbolinks.visit(query)
})

// Al recargar la página con autofocus, mover el caracter al final del texto.
$(document).on('focus', '.text-filtro', function () {
  let valor = this.value
  this.value = ''
  this.value = valor
})
