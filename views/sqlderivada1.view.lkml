view: sqlderivada1 {
  derived_table: {
    persist_for: "30 minutes"
    sql: SELECT
          "products"."brand" AS "products.brand",
          "users"."first_name" AS "users.first_name",
          "users"."gender" AS "users.gender",
          "users"."zip" AS "users.zip",
          "orders"."id" AS "orders.id",
          "users"."state" AS "users.state"
      FROM
          "public"."order_items" AS "order_items"
          LEFT JOIN "public"."orders" AS "orders" ON "order_items"."order_id" = "orders"."id"
          LEFT JOIN "public"."inventory_items" AS "inventory_items" ON "order_items"."inventory_item_id" = "inventory_items"."id"
          LEFT JOIN "public"."users" AS "users" ON "orders"."user_id" = "users"."id"
          LEFT JOIN "public"."products" AS "products" ON "inventory_items"."product_id" = "products"."id"
      --WHERE "orders"."status" = 'complete'

      -- WHERE {% condition select_state %} users.state {% endcondition %} --puede ir con comillas "users"."state"
        --      OR "users"."first_name"={%parameter parametrosnombres%}

        --static filter esto solo es para tablas nativas
         --filters: [users.state: "365 days"]




      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6
       ;;
  }

#pára el sugest explore se debe unir el explore "user" con otra vista que contenga el campo "users.state"
  filter: select_state {
    type: string
    suggest_explore: users
    suggest_dimension: users.state

  }

parameter: parametrosnombres {
  type: string
  default_value: "Lewis"
  allowed_value: {value:"Joshua"}
  allowed_value: {value:"Evelyn"}

}


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: products_brand {
    type: string
    sql: ${TABLE}."products.brand" ;;
  }

  dimension: users_first_name {
    type: string
    sql: ${TABLE}."users.first_name" ;;
  }

  dimension: users_gender {
    type: string
    sql: ${TABLE}."users.gender" ;;
  }

  dimension: users_zip {
    type: number
    sql: ${TABLE}."users.zip" ;;
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}."orders.id" ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}."users.state" ;;
  }

  set: detail {
    fields: [
      products_brand,
      users_first_name,
      users_gender,
      users_zip,
      orders_id,
      users_state
    ]
  }
}
