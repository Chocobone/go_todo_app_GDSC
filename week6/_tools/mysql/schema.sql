CREATE TABLE `user`
(
    `id`        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '사용자 식별자',
    `name`      VARCHAR(20) NOT NULL COMMENT 'ユーザー名',
    `password`  VARCHAR(80) NOT NULL COMMENT '패스워드 해시',
    `role`      VARCHAR(80) NOT NULL COMMENT '역할', 
    `created`   DATETIME(6) NOT NULL COMMENT '레코드 작성 시간',
    `modified`  DATETIME(6) NOT NULL COMMENT '레코드 수정 시간',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='사용자';

CREATE TABLE `task` 
(
    `id`        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '테스크 식별자',
    `title`     VARCHAR(128) NOT NULL COMMENT '테스크 타이틀',
    `status`    VARCHAR(80) NOT NULL COMMENT '테스크 상태',
    `created`   DATETIME(6) NOT NULL COMMENT '레코드 작성 시간',
    `modified`  DATETIME(6) NOT NULL COMMENT '레코드 수정 시간',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='태스크';



-- CREATE TABLE `user`
-- (
--     `id`        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '사용자 식별자',
--     `name`      varchar(20) NOT NULL COMMENT '사용자명',
--     `password`  VARCHAR(80) NOT NULL COMMENT '패스워드 해시',
--     `role`      VARCHAR(80) NOT NULL COMMENT '역할', 
--     `created`   DATETIME(6) NOT NULL COMMENT '레코드 작성 시간',
--     `modified`  DATETIME(6) NOT NULL COMMENT '레코드 수정 시간',
--     PRIMARY KEY (`id`),
--     UNIQUE KEY `uix_name` (`name`) USING BTREE
-- ) Engine=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='사용자';

-- CREATE TABLE `task`
-- (
--     `id`        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '테스크 식별자',
--     `title`     varchar(128) NOT NULL COMMENT '테스크 타이틀',
--     `status`    VARCHAR(80) NOT NULL COMMENT '테스크 상태',
--     `created`   DATETIME(6) NOT NULL COMMENT '레코드 작성 시간',
--     `modified`  DATETIME(6) NOT NULL COMMENT '레코드 수정 시간',
--     PRIMARY KEY (`id`),
-- ) Engine=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='태스크';

-- CREATE USER 'your_user'@'%' IDENTIFIED BY 'your_password';
-- GRANT ALL PRIVILEGES ON *.* TO 'your_user'@'%' WITH GRANT OPTION;
-- FLUSH PRIVILEGES;
