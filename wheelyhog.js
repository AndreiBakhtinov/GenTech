//Спроектируйте схему реляционной БД для проекта онлайн-курсов.

users.id (1:M) enrollments.user_id

courses.id (1:M) enrollments.course_id

courses.id (1:M) lessons.course_id

lessons.id (1:M) progress.lesson_id

users.id (1:M) progress.user_id