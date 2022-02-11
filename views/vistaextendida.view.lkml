include: "orders.view"
include: "products.view"
view: vistaextendida {

  extends: [orders,products]

  dimension: id_concatenado {
    sql: ${statusss};;
  }

 }
