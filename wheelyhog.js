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

Ref: categories.category_id > products.product_id






Ref: "orders"."order_id" < "customers"."customer_id"


Ref: "customers"."customer_id" < "employees"."employee_id"

Ref: "order_details"."order_detail_id" < "products"."product_id"

Ref: "orders"."order_id" < "employees"."employee_id"

Ref: "shippers"."shipper_id" < "orders"."order_id"