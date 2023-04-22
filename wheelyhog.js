customerID(M: 1) employeeID
customerID(1: M) orders.orderIDD
orderID(1: 1) customerID
orderID(M: 1) employeeID
orderDetails.orderDetailID(1: M) orderID
orderDetailID(1: M) products.productID
productID(M: 1) categoryID
shipperID(1: M) orders.orderID
suppliers.supplierID(1: M) products.productID


Table customers {
  customer_id integer
}


Table categories {
  category_id integer
}

Table employees {
  employee_id integer
}

Table order_details {
  order_detail_id integer
}

Table products {
  product_id integer
}

Table orders {
  order_id integer
}

Table shippers {
  shipper_id integer
}

Ref: categories.category_id < products.product_id


Ref: "orders"."order_id" > "customers"."customer_id"


Ref: "customers"."customer_id" > "employees"."employee_id"

Ref: "order_details"."order_detail_id" < "products"."product_id"

Ref: "orders"."order_id" > "employees"."employee_id"

Ref: "shippers"."shipper_id" < "orders"."order_id"

Ref: "order_details"."order_detail_id" < "orders"."order_id"



// Use DBML to define your database structure
// Docs: https://www.dbml.org/docs

Table customers {
  customer_id integer
  customer_name varchar
  customer_email varchar
  customer_password varchar

}


Table tickets {
  ticket_id integer
  user_id integer
  event_id integer
  place integer
}

Table events {
  event_id integer
  movie_id integer
  event_price integer
}




Ref: "customers"."customer_id" < "tickets"."ticket_id"

Ref: "events"."event_id" < "customers"."customer_id"

Ref: "events"."event_id" < "tickets"."ticket_id"