CREATE TABLE viledges (
    id smallint unsigned NOT NULL AUTO_INCREMENT,
    name varchar(64) NOT NULL,
    update_hour tinyint unsigned NOT NULL COMMENT "更新時刻。0時-23時のいずれか",
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(id)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE viledger_roles (
    viledge_id smallint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    role_name varchar(16) NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id) REFERENCES viledges(id),
    FOREIGN KEY(role_name) REFERENCES roles(name)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE viledgers (
    viledge_id smallint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    player_name varchar(16) NOT NULL,
    character_chip_id smallint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledger_roles(viledge_id, viledger_number),
    FOREIGN KEY(player_name) REFERENCES players(name),
    FOREIGN KEY(character_chip_id) REFERENCES character_chips(id),
    UNIQUE KEY(viledge_id, character_chip_id)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE viledger_deaths (
    viledge_id smallint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    day tinyint unsigned NOT NULL COMMENT '死亡した日',
    cause enum('attacked', 'hanged', 'sudden_death'),
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE viledge_ends (
    viledge_id smallint unsigned NOT NULL,
    days tinyint unsigned NOT NULL COMMENT 'ゲーム内時間で何日目に終了したか',
    winner_team enum('human', 'werewolf', 'other') NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(viledge_id),
    FOREIGN KEY(viledge_id) REFERENCES viledges(id)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';
