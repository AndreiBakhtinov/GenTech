// Table users {
//   id integer [primary key]
//   username varchar
//   role varchar
//   group_id integer
//   created_at timestamp
// }

// Table groups {
//   id integer [primary key]
//   title varchar
//   course_id integer
//   created_at timestamp
// }

// Table courses {
//   id integer [primary key]
//   title varchar
//   subject_id integer
//   created_at timestamp
// }

// Table subjects {
//   id integer [primary key]
//   title varchar
//   created_at timestamp
// }

// Table lessons {
//   id integer [primary key]
//   group_id integer
//   teacher_id integer
//   subject_id integer
//   start timestamp
//   end timestamp
//   created_at timestamp
// }

// Table homeworks {
//   id integer [primary key]
//   teacher_id integer
//   subject_id integer
//   title varchar
//   task varchar
//   finish_at timestamp
//   created_at timestamp
// }

// Table completed_homeworks {
//   id integer [primary key]
//   homework_id integer
//   student_id integer
//   created_at timestamp
// }

// Ref: groups.id < users.group_id // one-to-many

// Ref: courses.id < groups.course_id // one-to-many

// Ref: subjects.id < courses.subject_id // one-to-many

// Ref: users.id < lessons.teacher_id // one-to-many

// Ref: subjects.id < lessons.subject_id // one-to-many

// Ref: groups.id < lessons.group_id // one-to-many

// Ref: users.id < completed_homeworks.student_id // one-to-many

// Ref: users.id < homeworks.teacher_id // one-to-many

// Ref: subjects.id < homeworks.subject_id // one-to-many

// Ref: homeworks.id < completed_homeworks.homework_id // one-to-many
