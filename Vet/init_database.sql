USE VetManagement;

-- ====================================================
-- BƯỚC 1: XÓA SẠCH DỮ LIỆU CŨ (RESET DB)
-- ====================================================
DROP TABLE IF EXISTS Prescriptions;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Users;

-- ====================================================
-- BƯỚC 2: TẠO LẠI CẤU TRÚC BẢNG (SCHEMA)
-- ====================================================

-- 2.1. Bảng Users (Có thêm cột gender)
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    gender VARCHAR(10),       -- Cột này phục vụ trang Profile
    password VARCHAR(50),
    full_name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    role ENUM('CLIENT', 'DOCTOR', 'STAFF') NOT NULL,
    specialization VARCHAR(100),
    address VARCHAR(200),
    salary DOUBLE,
    job_title VARCHAR(100)
);

-- 2.2. Bảng Appointments (Có thêm booking_time, pet_name, note)
CREATE TABLE Appointments (
    app_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, 
    service_name VARCHAR(100),
    
    -- Lưu ngày (VARCHAR để lưu được 'Mon', '2023-11-20'...)
    booking_date VARCHAR(50), 
    
    -- Các cột mới cho giao diện Booking
    booking_time VARCHAR(20),  -- Lưu giờ (VD: 8:00 AM)
    pet_name VARCHAR(100),     -- Lưu tên thú cưng
    note TEXT,                 -- Lưu ghi chú triệu chứng
    
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 2.3. Bảng Prescriptions
CREATE TABLE Prescriptions (
    pres_id INT PRIMARY KEY AUTO_INCREMENT,
    app_id INT,
    diagnosis TEXT,
    medicine TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (app_id) REFERENCES Appointments(app_id)
);

-- ====================================================
-- BƯỚC 3: KHỞI TẠO DỮ LIỆU MẪU (SEED DATA)
-- ====================================================

-- CHỈ THÊM BÁC SĨ (Không thêm Client nào cả)
INSERT INTO Users (username, password, full_name, role, specialization, salary, gender) 
VALUES ('doctor1', '123', 'Dr. Strange', 'DOCTOR', 'Phẫu thuật', 5000.0, 'Male');

-- ====================================================
-- BƯỚC 4: KIỂM TRA
-- ====================================================
SELECT * FROM Users; 
-- Kết quả mong đợi: Chỉ có 1 dòng duy nhất là Dr. Strange.