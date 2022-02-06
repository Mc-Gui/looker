include: vistapaextender.view
view: inventory_items {
  extends: [vistapaextender]



  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.inventory_items ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

filter: filtrodefecha {
  type: date

}

parameter: parametro {
  type: string
  default_value: "xxxx"
  allowed_value: {label:"valor1"
                  value:"estoesvalido"}

}

  dimension: afectado{

    sql: {% if filtrodefecha==null%}'yes'{%endif%} ;;
  }


  dimension: liquidObject {
    type: string
    #link: {
   #   url: " https://help.looker.com/hc/en-us/articles/360023722974-A-Simple-Explanation-of-Symmetric-Aggregates-or-Why-On-Earth-Does-My-SQL-Look-Like-That-"
    #}

    #sql: '{{ link}}' ;;<------no supe
    #sql: '{{_model._name}}' ;;  #----> imprime el nombre del proyecto
    #sql:'{{_field._name}}'  ;;
    #sql: '{{_query._query_timezone}}' ;;
    #sql:'{{inventory_items._in_query}}'---->este no jalo tal cual por que regresa un booleano,no es una dimension tipica/mal definida
  }

  dimension: liquidTag {
    # sql:{%if _model._name!="hol"%} 'diferente' {% endif %};;
    #sql: {%if products._in_query!= true%} 'notrue'{% endif %};;
    #sql: {%date_start order_items.fecha %};;#--->si se le pone' imprime como cadena, se utiliza como tag no como object lo dice la documentacion
    sql: {%date_start filtrodefecha %};;
    #sql: {%date_start created_date %};;---->este no jalo (tiene q ser un filtro)
    #sql: {% if "order_items".parametrofec._parameter_value==null%}'yes'{%endif%} ;;



  }


  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
    drill_fields: [cost]
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id, products.id, products.item_name, order_items.count]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_cost {
    type: sum
    hidden: yes
    sql: ${cost} ;;
  }

  measure: average_cost {
    type: average
    hidden: yes
    sql: ${cost} ;;
  }
}
