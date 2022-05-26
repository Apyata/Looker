- dashboard: bus_overview
  title: bus_overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: bus_overview
    name: bus_overview
    model: ecommerce_ashutosh
    explore: users
    type: looker_grid
    fields: [users.age, users.age_tier, users.city, users.count]
    sorts: [users.age_tier]
    limit: 500
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      City: users.city
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: ecommerce_ashutosh
    explore: users
    listens_to_filters: []
    field: users.city
