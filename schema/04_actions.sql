CREATE TABLE votings (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day, viledger_number),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '日別の最終的な吊り投票先';

CREATE TABLE voting_histories (
    id mediumint unsigned NOT NULL AUTO_INCREMENT,
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(id),
    KEY(viledge_id, day, created_at),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '吊り投票先の変更履歴';

CREATE TABLE scrying_targets (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day, viledger_number),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '日別の最終的な占い先';

CREATE TABLE scrying_target_histories (
    id mediumint unsigned NOT NULL AUTO_INCREMENT,
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(id),
    KEY(viledge_id, day, created_at),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '占い先の変更履歴';

CREATE TABLE guarding_targets (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day, viledger_number),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '日別の最終的な護衛先';

CREATE TABLE guarding_target_histories (
    id mediumint unsigned NOT NULL AUTO_INCREMENT,
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(id),
    KEY(viledge_id, day, created_at),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '護衛先の変更履歴';

CREATE TABLE attacking_targets (
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    updated_at timestamp NOT NULL DEFAULT current_timestamp  ON UPDATE current_timestamp,
    PRIMARY KEY(viledge_id, day),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '日別の最終的な襲撃先';

CREATE TABLE attacking_target_histories (
    id mediumint unsigned NOT NULL AUTO_INCREMENT,
    viledge_id smallint unsigned NOT NULL,
    day tinyint unsigned NOT NULL,
    viledger_number tinyint unsigned NOT NULL,
    target_viledger_number tinyint unsigned NOT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY(id),
    KEY(viledge_id, day, created_at),
    FOREIGN KEY(viledge_id, viledger_number) REFERENCES viledgers(viledge_id, viledger_number),
    FOREIGN KEY(viledge_id, target_viledger_number) REFERENCES viledgers(viledge_id, viledger_number)
) ENGINE InnoDB CHARSET='utf8mb4' COMPRESSION='zlib' COMMENT '各狼の襲撃先の変更履歴';
