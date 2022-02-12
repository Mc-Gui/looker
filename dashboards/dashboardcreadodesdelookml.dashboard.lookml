- dashboard: dashboardname
  title: auserwillseethisname
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: a_merge
    title: a_merge
    merged_queries:
    - model: dcl_training
      explore: order_items
      type: looker_column
      fields: [orders.count, orders_derived.city, orders.created_week]
      filters:
        orders_derived.city: B%
        orders.created_week: '2016'
      sorts: [orders.count desc]
      limit: 500
      column_limit: 50
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
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
      limit_displayed_rows: false
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
    - model: moon
      explore: moon_phases
      type: table
      fields: [moon_phases.peak_week, moon_phases.phase, moon_phases.phase_emoji]
      filters:
        moon_phases.peak_week: '2016'
      sorts: [moon_phases.peak_week]
      limit: 500
      query_timezone: America/Mexico_City
      join_fields:
      - field_name: moon_phases.peak_week
        source_field_name: orders.created_week
    type: table
    sorts: [orders.created_week desc]
    row: 0
    col: 0
    width: 8
    height: 6
