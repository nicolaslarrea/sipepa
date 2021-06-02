module ApplicationHelper
  # Tag para búsqueda genérica con ajax.
  def filtro_busqueda_tag(key:, value:, url:, label:, data: {})
    content_tag(
      :div,
      safe_join(
        [
          content_tag(
            :span,
            content_tag(:i, nil, class: "fas fa-search"),
            class: "input-group-text border-0 bg-transparent",
            id: "search-addon"
          ),
          text_field_tag(
            key,
            value,
            data: { url: url, key: key }.merge(data),
            class: 'form-control rounded select-filtro text-filtro',
            autofocus: value.present?
          )
        ]
      ),
      class: "input-group rounded"
    )
  end
end
