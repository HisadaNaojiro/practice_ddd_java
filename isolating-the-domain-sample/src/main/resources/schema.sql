DROP SCHEMA IF EXISTS 給与;
CREATE SCHEMA 給与;

CREATE TABLE 給与.従業員 (
  従業員ID  INTEGER PRIMARY KEY,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE SEQUENCE 給与.従業員ID;

CREATE TABLE 給与.従業員の名前履歴 (
  従業員名ID INTEGER PRIMARY KEY,
  従業員ID  INTEGER NOT NULL,
  従業員名 VARCHAR(40) NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY (従業員ID) REFERENCES 給与.従業員(従業員ID)
);
CREATE SEQUENCE 給与.従業員名ID;

CREATE TABLE 給与.従業員の名前 (
  従業員ID  INTEGER NOT NULL,
  従業員名ID INTEGER NOT NULL,
  従業員名 VARCHAR(40) NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (従業員ID)
    ,FOREIGN KEY (従業員ID) REFERENCES  給与.従業員(従業員ID)
    ,FOREIGN KEY (従業員名ID) REFERENCES  給与.従業員の名前履歴(従業員名ID)
);

CREATE TABLE 給与.従業員の電話番号履歴 (
  従業員電話番号ID INTEGER PRIMARY KEY,
  従業員ID  INTEGER NOT NULL,
  電話番号 VARCHAR(13) NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY (従業員ID) REFERENCES 給与.従業員(従業員ID)
);
CREATE SEQUENCE 給与.従業員電話番号ID;

CREATE TABLE 給与.従業員の電話番号 (
  従業員ID INTEGER NOT NULL,
  従業員電話番号ID INTEGER NOT NULL,
  電話番号 VARCHAR(13) NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (従業員ID)
    ,FOREIGN KEY (従業員ID) REFERENCES  給与.従業員(従業員ID)
    ,FOREIGN KEY (従業員電話番号ID) REFERENCES  給与.従業員の電話番号履歴(従業員電話番号ID)
);


CREATE TABLE 給与.従業員のメールアドレス履歴 (
  従業員メールアドレスID INTEGER PRIMARY KEY,
  従業員ID  INTEGER NOT NULL,
  メールアドレス VARCHAR(255) NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY (従業員ID) REFERENCES 給与.従業員(従業員ID)
);
CREATE SEQUENCE 給与.従業員メールアドレスID;

CREATE TABLE 給与.従業員のメールアドレス (
  従業員ID  INTEGER NOT NULL,
  従業員メールアドレスID INTEGER NOT NULL,
  メールアドレス VARCHAR(255) NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (従業員ID)
    ,FOREIGN KEY (従業員ID) REFERENCES  給与.従業員(従業員ID)
    ,FOREIGN KEY (従業員メールアドレスID) REFERENCES  給与.従業員のメールアドレス履歴(従業員メールアドレスID)
);

CREATE TABLE 給与.契約中 (
  従業員ID  INTEGER PRIMARY KEY,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY (従業員ID) REFERENCES 給与.従業員(従業員ID)
);

CREATE TABLE 給与.契約終了 (
  従業員ID  INTEGER PRIMARY KEY,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY (従業員ID) REFERENCES 給与.従業員(従業員ID)
);

CREATE TABLE 給与.就業時間履歴 (
  就業時間ID INTEGER PRIMARY KEY,
  従業員ID INTEGER NOT NULL,
  就業日 DATE NOT NULL,
  開始時刻 VARCHAR NOT NULL,
  終了時刻 VARCHAR NOT NULL,
  休憩時間 INTEGER NOT NULL,
  深夜休憩時間 INTEGER NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY (従業員ID) REFERENCES  給与.従業員(従業員ID)
);

CREATE TABLE 給与.就業時間 (
  従業員ID INTEGER NOT NULL,
  就業時間ID INTEGER NOT NULL,
  就業日 DATE NOT NULL,
  開始時刻 VARCHAR NOT NULL,
  終了時刻 VARCHAR NOT NULL,
  休憩時間 INTEGER NOT NULL,
  深夜休憩時間 INTEGER NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (従業員ID, 就業日)
    ,FOREIGN KEY (従業員ID) REFERENCES  給与.従業員(従業員ID)
    ,FOREIGN KEY (就業時間ID) REFERENCES  給与.就業時間履歴(就業時間ID)
);

CREATE SEQUENCE 給与.就業時間ID;

CREATE TABLE 給与.時給契約履歴 (
  時給ID INTEGER NOT NULL PRIMARY KEY,
  従業員ID INTEGER NOT NULL,
  時給 INTEGER NOT NULL,
  時間外割増率 INTEGER NOT NULL,
  深夜割増率 INTEGER NOT NULL,
  適用開始日 DATE NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,FOREIGN KEY (従業員ID) REFERENCES  給与.従業員(従業員ID)
);

CREATE SEQUENCE 給与.時給ID;

CREATE TABLE 給与.時給契約 (
  従業員ID INTEGER NOT NULL,
  時給 INTEGER NOT NULL,
  時間外割増率 INTEGER NOT NULL,
  深夜割増率 INTEGER NOT NULL,
  適用開始日 DATE NOT NULL,
  登録日時 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,PRIMARY KEY (従業員ID, 適用開始日)
    ,FOREIGN KEY (従業員ID) REFERENCES  給与.従業員(従業員ID)
);
