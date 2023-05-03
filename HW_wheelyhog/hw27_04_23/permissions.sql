CREATE TABLE `typycal_permissions` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `description` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `issued_permissions` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `permission_id` int,
  `start_date` timestamp,
  `end_date` timestamp,
  `author_id` int,
  `created_at` timestamp
);

CREATE TABLE `users` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `user_name` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `roles` (
  `role_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `role_description` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `users_roles` (
  `user_id` int,
  `role_id` int
);

ALTER TABLE `users` ADD FOREIGN KEY (`user_id`) REFERENCES `issued_permissions` (`user_id`);

ALTER TABLE `typycal_permissions` ADD FOREIGN KEY (`id`) REFERENCES `users` (`user_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`user_id`) REFERENCES `issued_permissions` (`author_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`user_id`) REFERENCES `users_roles` (`user_id`);

ALTER TABLE `roles` ADD FOREIGN KEY (`role_id`) REFERENCES `users_roles` (`role_id`);

ALTER TABLE `typycal_permissions` ADD FOREIGN KEY (`id`) REFERENCES `issued_permissions` (`permission_id`);
