/* =========================
   TẠO DATABASE
========================= */
IF DB_ID('EShopDb') IS NULL
BEGIN
    CREATE DATABASE EShopDb;
END
GO

USE EShopDb;
GO

/* =========================
   TẠO BẢNG CATEGORIES
========================= */
IF OBJECT_ID('Categories', 'U') IS NOT NULL
    DROP TABLE Categories;
GO

CREATE TABLE Categories
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255) NULL
);
GO

/* =========================
   TẠO BẢNG PRODUCTS
========================= */
IF OBJECT_ID('Products', 'U') IS NOT NULL
    DROP TABLE Products;
GO

CREATE TABLE Products
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(150) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL,
    CategoryId INT NOT NULL,

    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryId)
        REFERENCES Categories(Id)
        ON DELETE CASCADE
);
GO

/* =========================
   DỮ LIỆU MẪU
========================= */
INSERT INTO Categories (Name, Description)
VALUES
(N'Laptop', N'Sản phẩm laptop'),
(N'Phone', N'Sản phẩm điện thoại');
GO

INSERT INTO Products (Name, Price, Stock, CategoryId)
VALUES
(N'Dell XPS 13', 25000000, 10, 1),
(N'iPhone 15', 30000000, 5, 2);
GO

/* =========================
   KIỂM TRA KẾT QUẢ
========================= */
SELECT * FROM Categories;
SELECT * FROM Products;
GO
