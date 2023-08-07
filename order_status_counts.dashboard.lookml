- dashboard: order_status_counts
  title: Order Status Counts
  layout: newspaper
  description : "test"
  preferred_viewer: dashboards-next
  tile_size: 100

  elements:
  - title: Order_status _test
    name: Order_status _test
    description: "'{{ _localization['test'] }}'"
    model: ecommerce_ashutosh
    explore: orders
    type: looker_grid
    fields: [orders.status, orders.count, users.count]
    filters: {}
    sorts: [orders.count desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    listen:
      Status: orders.status
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Status
    title: Status
    type: field_filter
    default_value: "{{_localization['airline']}},{{_localization['airline']}}"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: balcazartest
    explore: orders
    listens_to_filters: []
    field: orders.status
  - name: Status (2)
    title: Status (2)
    type: field_filter
    default_value: "{{_localization['id.ids']}},{{_localization['id.ids']}}"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: orders
    listens_to_filters: []
    field: orders.status
  - name: Age (Yes / No)
    title: Age (Yes / No)
    type: field_filter
    default_value: "{{_localization['reporting.yes']}},{{_localization['reporting.no']}}"
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
    model: ecommerce_ashutosh
    explore: orders
    listens_to_filters: []
    field: orders.age
    model: ecommerce_ashutosh
    explore: orders
    listens_to_filters: []
    field: orders.age
