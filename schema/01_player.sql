CREATE TABLE players (
    name varchar(16) NOT NULL,
    introduction varchar(400) NOT NULL DEFAULT '' COMMENT '自己紹介文',
    url varchar(400) NOT NULL DEFAULT '' COMMENT 'SNS等へのリンク',
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(name)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE player_passwords (
    player_name varchar(16) NOT NULL,
    mail_address varchar(100) NOT NULL,
    hashed_password varchar(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY (player_name),
    UNIQUE KEY (mail_address),
    FOREIGN KEY (player_name) REFERENCES players (name)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';
