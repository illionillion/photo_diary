-- user_234201でログインする場合は、その前にrootでログインして権限を割り当てる必要がある
ALTER USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'admin_pass';

-- 日記テーブル
CREATE TABLE diary (
    diary_id INT PRIMARY KEY AUTO_INCREMENT,
    diary_title VARCHAR(255) NOT NULL,
    diary_content TEXT NOT NULL
);

-- 日記画像テーブル
CREATE TABLE diary_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    diary_id INT NOT NULL,
    diary_image_data LONGBLOB NOT NULL,
    FOREIGN KEY (diary_id) REFERENCES diary(diary_id)
);

-- users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255) NOT NULL,
    password LONGTEXT NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(255),
    role INT
);
-- 初期データ（初回導入時はこれを実行してシステムにログインできるようにする）
INSERT INTO users (user_name, password, phone_number, email, role)
VALUES ('Admin', SHA2('password', 256), '1234567890', 'admin@example.com', 0);

-- 蔵書のカテゴリ
CREATE TABLE book_category (
    book_category_id INT PRIMARY KEY AUTO_INCREMENT,
    book_category_name VARCHAR(255)
);

INSERT INTO book_category (book_category_name)
VALUES ('技術書'), ('ビジネス'), ('コミック'), ('小説');

-- 蔵書
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(255),
    book_category INT,
    regist_date TIMESTAMP,
    regist_id INT,
    FOREIGN KEY (book_category) REFERENCES book_category(book_category_id),
    FOREIGN KEY (regist_id) REFERENCES users(user_id)
);

INSERT INTO books (book_name, book_category, regist_date, regist_id)
VALUES ('優しいJavaScript', 1, now(), 1), ('経営マスター', 2, now(), 1), ('Docker対全集', 1, now(), 1), ('DRAGON BALL', 3, now(), 1), ('神様のカルテ', 4, now(), 1);