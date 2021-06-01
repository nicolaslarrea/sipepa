module ApplicationHelper
  # Tag para búsqueda genérica con ajax.
  def filtro_busqueda_tag(key:, value:, url:, label:, data: {})
    safe_join(
      [
        label_tag(label, nil, class: 'bmd-label-floating'),
        text_field_tag(
          key,
          value,
          data: { url: url, key: key }.merge(data),
          class: 'form-control select-filtro text-filtro',
          autofocus: value.present?
        )
      ]
    )
  end
end
