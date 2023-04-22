// users
// courses (FE, BackEnd, QA)
// groups
// lessons
// homeworks

// users.id (1:M) groups.student_id
// users.id (1:M) groups.teacher_id
// courses.id (1:M) groups.topic_id => направления -> группы
// lessons.id (1:M) groups.lesson_id
// homeworks.id (1:M) users.student_id
// homeworks.id (1:M) users.teacher_id
