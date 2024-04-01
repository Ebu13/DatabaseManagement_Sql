CREATE TYPE user_type_enum AS ENUM ('DomesticSupplier', 'ForeignBuyer');
CREATE TYPE request_type_enum AS ENUM ('Return', 'Cancellation');
CREATE TYPE status_enum AS ENUM ('Pending', 'Approved', 'Rejected');
-- Kullanıcılar tablosu
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_type user_type_enum NOT NULL
);

-- Ürünler tablosu
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id), -- Ürünü ekleyen kullanıcı
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ürün Kategorileri tablosu
CREATE TABLE ProductCategories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Ürünlerin Kategori İlişkisi tablosu
CREATE TABLE ProductCategoryMapping (
    product_id INT REFERENCES Products(product_id),
    category_id INT REFERENCES ProductCategories(category_id),
    PRIMARY KEY (product_id, category_id)
);

-- Stoklar tablosu
CREATE TABLE Stocks (
    stock_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Siparişler tablosu
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10, 2) NOT NULL
);

-- Sipariş Detayları tablosu
CREATE TABLE OrderDetails (
    detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

-- İade ve İptal Talepleri tablosu
CREATE TABLE ReturnAndCancellationRequests (
    request_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    user_id INT REFERENCES Users(user_id),
    request_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    request_type request_type_enum NOT NULL,
    status status_enum DEFAULT 'Pending'
);

-- Değerlendirme ve Yorumlar tablosu
CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    product_id INT REFERENCES Products(product_id),
    rating INT NOT NULL,
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Mesajlaşmalar tablosu (Kullanıcılar arası mesajlaşma)
CREATE TABLE Messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT REFERENCES Users(user_id),
    receiver_id INT REFERENCES Users(user_id),
    message_text TEXT NOT NULL,
    send_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE
);
