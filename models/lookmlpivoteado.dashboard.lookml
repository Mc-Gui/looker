- dashboard: lookmlpivoteado
  title: Lookmlpivoteado
  model: proyecto_copia
  explore: order_items
  type: looker_grid
  fields: [nombre, orders.count, inventory_items.sold_year]
  pivots: [inventory_items.sold_year]
  fill_fields: [inventory_items.sold_year]
  filters:
    order_items.parametrofec: 2022/02/11
    inventory_items.cost: "[0, 100]"
    orders.statusss: complete
    products.brand3: ''
    users.gender: ''
    users.state: ''
  sorts: [inventory_items.sold_year, orders.count desc 0]
  limit: 500
  column_limit: 50
  total: true
  dynamic_fields:
  - category: dimension
    expression: concat(${users.first_name}, " ",${users.last_name})
    label: nombre
    value_format:
    value_format_name:
    dimension: nombre
    _kind_hint: dimension
    _type_hint: string
  - category: table_calculation
    expression: if(offset(${orders.count},0)=offset(${orders.count},1),"igualanterior","dif")
    label: diferentes con offset
    value_format:
    value_format_name:
    _kind_hint: measure
    table_calculation: diferentes_con_offset
    _type_hint: string
    is_disabled: true
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
  hidden_fields: []
  y_axes: []
