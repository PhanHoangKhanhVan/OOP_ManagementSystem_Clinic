USE VetManagement;

-- 1. Xóa bảng cũ đi (Xóa theo thứ tự con trước -> cha sau để không lỗi khóa ngoại)
DROP TABLE IF EXISTS Prescriptions;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Users;

-- 2. Tạo lại bảng USERS (Cha)
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
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

-- 3. Tạo lại bảng APPOINTMENTS (Con của Users)
CREATE TABLE Appointments (
    app_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, 
    service_name VARCHAR(100),
    booking_date DATE,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 4. Tạo lại bảng PRESCRIPTIONS (Con của Appointments)
CREATE TABLE Prescriptions (
    pres_id INT PRIMARY KEY AUTO_INCREMENT,
    app_id INT,
    diagnosis TEXT,
    medicine TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (app_id) REFERENCES Appointments(app_id)
);

-- 5. Thêm dữ liệu mẫu (User)
INSERT INTO Users (username, password, full_name, role, address) 
VALUES ('client1', '123', 'Nguyen Van A', 'CLIENT', 'TP. HCM');

INSERT INTO Users (username, password, full_name, role, specialization, salary) 
VALUES ('doctor1', '123', 'Dr. Strange', 'DOCTOR', 'Phẫu thuật', 2000.0);

-- 6. Thêm dữ liệu mẫu (Lịch hẹn) - Lấy ID động để tránh lỗi
INSERT INTO Appointments (user_id, service_name, booking_date, status) 
VALUES 
((SELECT user_id FROM Users WHERE username = 'client1'), 'Khám tổng quát', '2023-11-20', 'Pending'),
((SELECT user_id FROM Users WHERE username = 'client1'), 'Tiêm phòng dại', '2023-11-21', 'Approved');

-- 7. Kiểm tra kết quả
SELECT * FROM Appointments;