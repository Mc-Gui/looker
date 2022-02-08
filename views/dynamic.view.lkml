view: dynamic{

  sql_table_name:
  --{{ _user_attributes['name_of_attribute'] }}.orders -- vista del esquema X
 --{% parameter tablename %}  -------elejir la tabla por el parametro

      {% if _user_attributes['name'] == 'value' %}

        ${view_name.field_name}={{_user_attributes['name']}}

      {% else %}

        1=1

      {% endif %} ;;



  parameter: tablename {
    type: unquoted
    allowed_value: {
      label: "orders"
      value: "orders"
    }
    allowed_value: {
      label: "products"
      value: "products"
    }
  }

  dimension: id {
    sql: ${TABLE}.id ;;
  }

  dimension: nombre_tabla {
    sql: '{{tablename._parameter_value  }}' ;;
  }
}
