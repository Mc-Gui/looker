view: dynamic{

  sql_table_name: {% parameter tablename %};;

  parameter: tablename {
    type: unquoted
    allowed_value: {
      label: "orders"
      value: "orders"
    }
    allowed_value: {
      label: "products"
      value: "prpducts"
    }
  }

  dimension: id {
    sql: ${TABLE}.id ;;
  }

  dimension: nombre_tabla {
    sql: '{{_view._name}}' ;;
  }
}
