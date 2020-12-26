CREATE TABLE roles (
    name varchar(16) NOT NULL,
    description varchar(600) NOT NULL,
    team enum('human', 'werewolf', 'other') NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(name)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE character_chips (
    id smallint unsigned NOT NULL AUTO_INCREMENT,
    title varchar(16) NOT NULL COMMENT '肩書',
    name varchar(16) NOT NULL,
    image_file_path varchar(500) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY (id)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';
