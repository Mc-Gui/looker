# The name of this view in Looker is "Applicable Roles"
view: applicable_roles {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: information_schema.applicable_roles ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Grantee" in Explore.

  dimension: grantee {
    type: string
    sql: ${TABLE}.grantee ;;
  }

  dimension: is_grantable {
    type: string
    sql: ${TABLE}.is_grantable ;;
  }

  dimension: role_name {
    type: string
    sql: ${TABLE}.role_name ;;
  }

  measure: count {
    type: count
    drill_fields: [role_name]
  }
}
