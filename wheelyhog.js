//Спроектируйте схему реляционной БД для проекта онлайн-курсов.

users.id (1:M) course.lesson_id
users.id (1:M) courses.teacher_id
workers.id (1:M) users.manager_id
orders.id (1:M) orders_details.order_id
orders_details.product_id (M:1) products.id