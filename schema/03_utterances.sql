CREATE TABLE regular_utterances (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    serial_number smallint unsigned NOT NULL COMMENT '日別の通し番号',
    viledger_number tinyint unsigned NOT NULL,
    body varchar(1000) NOT NULL,
    canceled enum('yes', 'no') NOT NULL DEFAULT 'no' COMMENT '発言者による取り消しの有無',
    censored enum('yes', 'no') NOT NULL DEFAULT 'no' COMMENT '運営による削除の有無',
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day, serial_number),
    FOREIGN KEY(viledge_id) REFERENCES viledges(id),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE deadman_moanings (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    serial_number smallint unsigned NOT NULL COMMENT '日別の通し番号',
    viledger_number tinyint unsigned NOT NULL,
    body varchar(1000) NOT NULL,
    canceled enum('yes', 'no') NOT NULL DEFAULT 'no' COMMENT '発言者による取り消しの有無',
    censored enum('yes', 'no') NOT NULL DEFAULT 'no' COMMENT '運営による削除の有無',
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day, serial_number),
    FOREIGN KEY(viledge_id) REFERENCES viledges(id),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE wolf_whispers (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    serial_number smallint unsigned NOT NULL COMMENT '日別の通し番号',
    viledger_number tinyint unsigned NOT NULL,
    body varchar(1000) NOT NULL,
    censored enum('yes', 'no') NOT NULL DEFAULT 'no' COMMENT '運営による削除の有無',
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day, serial_number),
    FOREIGN KEY(viledge_id) REFERENCES viledges(id),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';

CREATE TABLE monologues (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    serial_number smallint unsigned NOT NULL COMMENT '日別の通し番号',
    viledger_number tinyint unsigned NOT NULL,
    body varchar(1000) NOT NULL,
    censored enum('yes', 'no') NOT NULL DEFAULT 'no' COMMENT '運営による削除の有無',
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day, serial_number),
    FOREIGN KEY(viledge_id) REFERENCES viledges(id),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib';
