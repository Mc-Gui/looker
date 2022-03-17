# The name of this view in Looker is "Columns"
view: columns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: information_schema.columns ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Character Maximum Length" in Explore.

  dimension: character_maximum_length {
    type: number
    sql: ${TABLE}.character_maximum_length ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_character_maximum_length {
    type: sum
    sql: ${character_maximum_length} ;;
  }

  measure: average_character_maximum_length {
    type: average
    sql: ${character_maximum_length} ;;
  }

  dimension: character_octet_length {
    type: number
    sql: ${TABLE}.character_octet_length ;;
  }

  dimension: character_set_catalog {
    type: string
    sql: ${TABLE}.character_set_catalog ;;
  }

  dimension: character_set_name {
    type: string
    sql: ${TABLE}.character_set_name ;;
  }

  dimension: character_set_schema {
    type: string
    sql: ${TABLE}.character_set_schema ;;
  }

  dimension: collation_catalog {
    type: string
    sql: ${TABLE}.collation_catalog ;;
  }

  dimension: collation_name {
    type: string
    sql: ${TABLE}.collation_name ;;
  }

  dimension: collation_schema {
    type: string
    sql: ${TABLE}.collation_schema ;;
  }

  dimension: column_default {
    type: string
    sql: ${TABLE}.column_default ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.column_name ;;
  }

  dimension: data_type {
    type: string
    sql: ${TABLE}.data_type ;;
  }

  dimension: datetime_precision {
    type: number
    sql: ${TABLE}.datetime_precision ;;
  }

  dimension: domain_catalog {
    type: string
    sql: ${TABLE}.domain_catalog ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

  dimension: domain_schema {
    type: string
    sql: ${TABLE}.domain_schema ;;
  }

  dimension: dtd_identifier {
    type: string
    sql: ${TABLE}.dtd_identifier ;;
  }

  dimension: interval_precision {
    type: string
    sql: ${TABLE}.interval_precision ;;
  }

  dimension: interval_type {
    type: string
    sql: ${TABLE}.interval_type ;;
  }

  dimension: is_nullable {
    type: string
    sql: ${TABLE}.is_nullable ;;
  }

  dimension: is_self_referencing {
    type: string
    sql: ${TABLE}.is_self_referencing ;;
  }

  dimension: maximum_cardinality {
    type: number
    sql: ${TABLE}.maximum_cardinality ;;
  }

  dimension: numeric_precision {
    type: number
    sql: ${TABLE}.numeric_precision ;;
  }

  dimension: numeric_precision_radix {
    type: number
    sql: ${TABLE}.numeric_precision_radix ;;
  }

  dimension: numeric_scale {
    type: number
    sql: ${TABLE}.numeric_scale ;;
  }

  dimension: ordinal_position {
    type: number
    sql: ${TABLE}.ordinal_position ;;
  }

  dimension: scope_catalog {
    type: string
    sql: ${TABLE}.scope_catalog ;;
  }

  dimension: scope_name {
    type: string
    sql: ${TABLE}.scope_name ;;
  }

  dimension: scope_schema {
    type: string
    sql: ${TABLE}.scope_schema ;;
  }

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.table_catalog ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.table_schema ;;
  }

  dimension: udt_catalog {
    type: string
    sql: ${TABLE}.udt_catalog ;;
  }

  dimension: udt_name {
    type: string
    sql: ${TABLE}.udt_name ;;
  }

  dimension: udt_schema {
    type: string
    sql: ${TABLE}.udt_schema ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      scope_name,
      udt_name,
      domain_name,
      collation_name,
      character_set_name,
      column_name,
      table_name
    ]
  }
}
