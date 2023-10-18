-- Crear la base de datos
CREATE DATABASE info_tic CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- Seleccionar la base de datos
USE info_tic;

-- Tabla correos
CREATE TABLE mails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(100) UNIQUE NOT NULL,
    role ENUM(
        'Administrativo',
        'Estudiante',
        'Docente',
        'Seguridad'
    ) NOT NULL DEFAULT 'Estudiante',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Tabla usuarios
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    mail VARCHAR(50),
    pin TEXT NOT NULL,
    image TEXT NOT NULL,
    status INT DEFAULT 0,
    token TEXT,
    category ENUM('Administrador', 'Miembro') DEFAULT 'Miembro' NOT NULL,
    init_vector TEXT NOT NULL,
    face_descriptor TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Tabla noticias/información
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre ENUM(
        'Deportes',
        'Informativo',
        'Documentos',
        'Horarios'
    ) NOT NULL DEFAULT 'Informativo',
    resource TEXT NOT NULL,
    description TEXT NOT NULL,
    anchored INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla log
CREATE TABLE LOGS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user) REFERENCES users(id)
);

-- Tabla usuario-noticia
CREATE TABLE user_news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user INT,
    news INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user) REFERENCES users(id),
    FOREIGN KEY (news) REFERENCES news(id)
);

-- Tabla mensajes
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user INT,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user) REFERENCES users(id)
);
