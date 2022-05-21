CREATE TABLE `role` (
	`id_role` INT(11) NOT NULL AUTO_INCREMENT,
	`role_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id_role`)
);

CREATE TABLE `user` (
	`id_user` INT(11) NOT NULL AUTO_INCREMENT,
	`username` varchar(30) NOT NULL UNIQUE,
	`password` varchar(100) NOT NULL,
	`full_name` varchar(100) NOT NULL,
	`id_role` INT(11) NOT NULL,
	PRIMARY KEY (`id_user`)
);

CREATE TABLE `task` (
	`id_task` INT(11) NOT NULL,
	`task_name` varchar(100) NOT NULL,
	`detail` VARCHAR(255) NOT NULL,
	`time_given` DATETIME NOT NULL,
	`time_target` DATETIME NOT NULL,
	`time_done` DATETIME NOT NULL,
	`picture` VARCHAR(255) NOT NULL,
	`id_status` INT(11) NOT NULL,
	`id_worker` INT(11) NOT NULL,
	`id_task_giver` INT(11) NOT NULL,
	PRIMARY KEY (`id_task`)
);

CREATE TABLE `status` (
	`id_status` INT(11) NOT NULL AUTO_INCREMENT,
	`status_name` varchar(100) NOT NULL,
	PRIMARY KEY (`id_status`)
);

CREATE TABLE `contact_us` (
	`id_contact_us` INT(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`email` varchar(100) NOT NULL,
	`subject` varchar(100) NOT NULL,
	`message` TEXT(255) NOT NULL,
	PRIMARY KEY (`id_contact_us`)
);

CREATE TABLE `corporate` (
	`id_corporate` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
	`corporate_name` varchar(100) NOT NULL,
	`id_owner` INT(11) NOT NULL,
	PRIMARY KEY (`id_corporate`)
);

CREATE TABLE `corporate_employee` (
	`id_corporate_employee` INT(11) NOT NULL,
	`id_corporate` INT(11) NOT NULL,
	PRIMARY KEY (`id_corporate_employee`)
);

CREATE TABLE `detail_task` (
	`id_detail_task` INT(11) NOT NULL AUTO_INCREMENT,
	`id_task` INT(11) NOT NULL,
	`id_worker` INT(11) NOT NULL,
	PRIMARY KEY (`id_detail_task`)
);

ALTER TABLE `user` ADD CONSTRAINT `user_fk0` FOREIGN KEY (`id_role`) REFERENCES `role`(`id_role`);

ALTER TABLE `task` ADD CONSTRAINT `task_fk0` FOREIGN KEY (`id_status`) REFERENCES `status`(`id_status`);

ALTER TABLE `task` ADD CONSTRAINT `task_fk1` FOREIGN KEY (`id_worker`) REFERENCES `corporate_employee`(`id_corporate_employee`);

ALTER TABLE `task` ADD CONSTRAINT `task_fk2` FOREIGN KEY (`id_task_giver`) REFERENCES `user`(`id_user`);

ALTER TABLE `corporate` ADD CONSTRAINT `corporate_fk0` FOREIGN KEY (`id_owner`) REFERENCES `user`(`id_user`);

ALTER TABLE `corporate_employee` ADD CONSTRAINT `corporate_employee_fk0` FOREIGN KEY (`id_corporate_employee`) REFERENCES `user`(`id_user`);

ALTER TABLE `corporate_employee` ADD CONSTRAINT `corporate_employee_fk1` FOREIGN KEY (`id_corporate`) REFERENCES `corporate`(`id_corporate`);

ALTER TABLE `detail_task` ADD CONSTRAINT `detail_task_fk0` FOREIGN KEY (`id_task`) REFERENCES `task`(`id_task`);

ALTER TABLE `detail_task` ADD CONSTRAINT `detail_task_fk1` FOREIGN KEY (`id_worker`) REFERENCES `corporate_employee`(`id_corporate_employee`);









