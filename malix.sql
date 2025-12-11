-- Perro Malish

-- 1. LIMPIEZA
DROP TABLE IF EXISTS [ResumenVenta];
DROP TABLE IF EXISTS [Ventas];
DROP TABLE IF EXISTS [Albumes];
DROP TABLE IF EXISTS [Usuarios];
DROP TABLE IF EXISTS [ModosPago];
DROP TABLE IF EXISTS [Generos];
DROP TABLE IF EXISTS [Formatos]; 
DROP TABLE IF EXISTS [Artistas];
DROP TABLE IF EXISTS [Precios]; 

-- 2. CREACION DE TABLAS

CREATE TABLE [Artistas](
    [Id] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Nombre] TEXT UNIQUE NOT NULL
);

CREATE TABLE [Formatos](
    [Id] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Descripcion] TEXT NOT NULL,
    [Costo] REAL NOT NULL
);

CREATE TABLE [Generos](
    [Id] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Descripcion] TEXT NOT NULL
);

CREATE TABLE [ModosPago](
    [Id] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Descripcion] TEXT NOT NULL
);

CREATE TABLE [Usuarios](
    [Id] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Nombre] TEXT NOT NULL,
    [Apellido] TEXT NOT NULL,
    [Usuario] TEXT UNIQUE NOT NULL,
    [Contrasena] TEXT NOT NULL
);

CREATE TABLE [Albumes](
    [Id] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Titulo] TEXT NOT NULL,
    [Artista_Id] INTEGER NOT NULL REFERENCES [Artistas] ([Id]),
    [Genero_Id] INTEGER NOT NULL REFERENCES [Generos] ([Id]),
    [Formato_Id] INTEGER NOT NULL REFERENCES [Formatos] ([Id])
);

CREATE TABLE [Ventas](
    [Folio] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Fecha] DATETIME DEFAULT CURRENT_TIMESTAMP,
    [Usuario_Id] INTEGER REFERENCES [Usuarios] ([Id]),
    [ModoPago_Id] INTEGER REFERENCES [ModosPago] ([Id]),
    [Total] REAL DEFAULT 0
);

CREATE TABLE [ResumenVenta](
    [Id] INTEGER PRIMARY KEY AUTOINCREMENT,
    [Folio_Venta] INTEGER NOT NULL REFERENCES [Ventas] ([Folio]),
    [Album_Id] INTEGER NOT NULL REFERENCES [Albumes] ([Id]),
    [Cantidad] INTEGER NOT NULL,
    [Subtotal] REAL NOT NULL
);

-- 3. CARGA DE DATOS

-- FORMATOS (CD, Vinilo, Casete)
INSERT INTO Formatos (Descripcion, Costo) VALUES ('CD', 150.00);      -- ID 1
INSERT INTO Formatos (Descripcion, Costo) VALUES ('Vinilo', 450.00);  -- ID 2
INSERT INTO Formatos (Descripcion, Costo) VALUES ('Casete', 120.00);  -- ID 3

-- MODOS DE PAGO
INSERT INTO ModosPago (Descripcion) VALUES ('Efectivo');
INSERT INTO ModosPago (Descripcion) VALUES ('Tarjeta');

-- GENEROS
INSERT INTO Generos (Descripcion) VALUES ('Musica en Espanol');   -- 1
INSERT INTO Generos (Descripcion) VALUES ('Rock Alternativo'); -- 2
INSERT INTO Generos (Descripcion) VALUES ('Pop');               -- 3
INSERT INTO Generos (Descripcion) VALUES ('Jazz Fusion');       -- 4
INSERT INTO Generos (Descripcion) VALUES ('Indie Pop');         -- 5

-- ARTISTAS
INSERT INTO Artistas (Nombre) VALUES ('La Lupita');            -- 1
INSERT INTO Artistas (Nombre) VALUES ('Fobia');                -- 2
INSERT INTO Artistas (Nombre) VALUES ('Black Midi');           -- 3
INSERT INTO Artistas (Nombre) VALUES ('Enrique Iglesias');     -- 4
INSERT INTO Artistas (Nombre) VALUES ('Lady Gaga');            -- 5
INSERT INTO Artistas (Nombre) VALUES ('Masayoshi Takanaka');   -- 6
INSERT INTO Artistas (Nombre) VALUES ('Michael Jackson');      -- 7
INSERT INTO Artistas (Nombre) VALUES ('MO SOME TONEBENDER');   -- 8
INSERT INTO Artistas (Nombre) VALUES ('Shakira');              -- 9
INSERT INTO Artistas (Nombre) VALUES ('Ariel Pink');           -- 10
INSERT INTO Artistas (Nombre) VALUES ('Fishmans');             -- 11
INSERT INTO Artistas (Nombre) VALUES ('Foster the People');    -- 12 

-- 4. CARGA DE ALBUMES

-- 1. La Lupita
-- Pa Servir a Usted
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Pa Servir a Usted', 1, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Pa Servir a Usted', 1, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Pa Servir a Usted', 1, 1, 3);
-- Que Bonito es Casi Todo
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Que Bonito es Casi Todo', 1, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Que Bonito es Casi Todo', 1, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Que Bonito es Casi Todo', 1, 1, 3);
-- Tres D
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Tres D', 1, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Tres D', 1, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Tres D', 1, 1, 3);

-- 2. Fobia
-- Fobia
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Fobia', 2, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Fobia', 2, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Fobia', 2, 1, 3);
-- Mundo Feliz
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Mundo Feliz', 2, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Mundo Feliz', 2, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Mundo Feliz', 2, 1, 3);
-- Leche
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Leche', 2, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Leche', 2, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Leche', 2, 1, 3);

-- 3. Black Midi
-- Schlagenheim
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Schlagenheim', 3, 2, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Schlagenheim', 3, 2, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Schlagenheim', 3, 2, 3);
-- Cavalcade
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Cavalcade', 3, 2, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Cavalcade', 3, 2, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Cavalcade', 3, 2, 3);
-- Hellfire
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Hellfire', 3, 2, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Hellfire', 3, 2, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Hellfire', 3, 2, 3);

-- 4. Enrique Iglesias
-- Euphoria
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Euphoria', 4, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Euphoria', 4, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Euphoria', 4, 1, 3);
-- Final Vol.1
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Final Vol.1', 4, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Final Vol.1', 4, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Final Vol.1', 4, 1, 3);
-- Sex and Love
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Sex and Love', 4, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Sex and Love', 4, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Sex and Love', 4, 1, 3);

-- 5. Lady Gaga
-- Born This Way
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Born This Way', 5, 3, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Born This Way', 5, 3, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Born This Way', 5, 3, 3);
-- The Fame Monster
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('The Fame Monster', 5, 3, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('The Fame Monster', 5, 3, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('The Fame Monster', 5, 3, 3);
-- The Fame
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('The Fame', 5, 3, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('The Fame', 5, 3, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('The Fame', 5, 3, 3);

-- 6. Masayoshi Takanaka
-- ALL OF ME
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('ALL OF ME', 6, 4, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('ALL OF ME', 6, 4, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('ALL OF ME', 6, 4, 3);
-- Brasilian Skies
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Brasilian Skies', 6, 4, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Brasilian Skies', 6, 4, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Brasilian Skies', 6, 4, 3);
-- SEYCHELLE
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('SEYCHELLE', 6, 4, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('SEYCHELLE', 6, 4, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('SEYCHELLE', 6, 4, 3);

-- 7. Michael Jackson
-- Dangerous
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Dangerous', 7, 3, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Dangerous', 7, 3, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Dangerous', 7, 3, 3);
-- Off the Wall
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Off the Wall', 7, 3, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Off the Wall', 7, 3, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Off the Wall', 7, 3, 3);
-- Thriller
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Thriller', 7, 3, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Thriller', 7, 3, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Thriller', 7, 3, 3);

-- 8. MO SOME TONEBENDER
-- HELLO
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('HELLO', 8, 4, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('HELLO', 8, 4, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('HELLO', 8, 4, 3);
-- Rise from Hell
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Rise from Hell', 8, 4, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Rise from Hell', 8, 4, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Rise from Hell', 8, 4, 3);
-- DAWN ROCK
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('DAWN ROCK', 8, 4, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('DAWN ROCK', 8, 4, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('DAWN ROCK', 8, 4, 3);

-- 9. Shakira
-- Laundry Service
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Laundry Service', 9, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Laundry Service', 9, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Laundry Service', 9, 1, 3);
-- She Wolf
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('She Wolf', 9, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('She Wolf', 9, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('She Wolf', 9, 1, 3);
-- Donde Estan Los Ladrones
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Donde Estan Los Ladrones', 9, 1, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Donde Estan Los Ladrones', 9, 1, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Donde Estan Los Ladrones', 9, 1, 3);

-- 10. Ariel Pink
-- pom pom
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('pom pom', 10, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('pom pom', 10, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('pom pom', 10, 5, 3);
-- Mature Themes 
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Mature Themes', 10, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Mature Themes', 10, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Mature Themes', 10, 5, 3);
-- Dedicated to Bobby Jameson 
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Dedicated to Bobby Jameson', 10, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Dedicated to Bobby Jameson', 10, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Dedicated to Bobby Jameson', 10, 5, 3);

-- 11. Fishmans
-- Uchu Nippon Setagaya 
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Uchu Nippon Setagaya', 11, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Uchu Nippon Setagaya', 11, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Uchu Nippon Setagaya', 11, 5, 3);
-- LONG SEASON 
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('LONG SEASON', 11, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('LONG SEASON', 11, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('LONG SEASON', 11, 5, 3);
-- Kuchu Camp 
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Kuchu Camp', 11, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Kuchu Camp', 11, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Kuchu Camp', 11, 5, 3);

-- 12. Foster the People
-- Torches 
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Torches', 12, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Torches', 12, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Torches', 12, 5, 3);
-- Supermodel
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Supermodel', 12, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Supermodel', 12, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Supermodel', 12, 5, 3);
-- Paradise State of Mind 
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Paradise State of Mind', 12, 5, 1);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Paradise State of Mind', 12, 5, 2);
INSERT INTO Albumes (Titulo, Artista_Id, Genero_Id, Formato_Id) VALUES ('Paradise State of Mind', 12, 5, 3);