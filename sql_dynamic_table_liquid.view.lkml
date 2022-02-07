view: sql_dynamic_table_liquid {

  sql_table_name:

  {% if event.created_date._in_query %}

  event_by_day

  {% elsif event.created_week._in_query %}

  event_by_week

  {% else %}

  event

  {% endif %} ;;



  derived_table: {


    sql: select id
            from public.inventory_items
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  set: detail {
    fields: [id]
  }
}
