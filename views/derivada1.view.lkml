view: derivada1 {
    derived_table: {

      #sql_trigger_value: SELECT CURDATE() ;;

      explore_source: order_items {
        column: brand { field: products.brand }
        column: first_name { field: users.first_name }
        column: gender { field: users.gender }
        column: zip { field: users.zip }
        column: id { field: orders.id }
        column: state { field: users.state }
        #--------------------------------------------------
        filters: {
          field: orders.statusss
          value: "complete"
        }
        #bind_all_filters: yes

      }

    }




    dimension: brand {}
    dimension: first_name {}
    dimension: gender {}
    dimension: zip {
      type: zipcode
    }
    dimension: id {
      primary_key: yes
      type: number
    }
    dimension: state {}
  }
