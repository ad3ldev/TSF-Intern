-- @BLOCK
CREATE TABLE Customers(
    account_num SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(511),
    phone VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    current_balance MONEY,
    country VARCHAR(2) NOT NULL
);
-- @BLOCK
CREATE TABLE Transfers(
    tranfer_id SERIAL PRIMARY KEY,
    from_account INT NOT NULL,
    to_account INT NOT NULL,
    amount MONEY NOT NULL
);
-- @BLOCK
INSERT INTO Customers (name, address, phone, email, current_balance, country)
VALUES 
    ('Victoria Lindström', 'Bjørnvej 2, 5. 9437 Hadsten', '+45 16 05 21 64', 'debbesen@yahoo.dk', -123.2 , 'DK'),
    ('Samuel Gautier','9, chemin de Barthelemy 76 068 Moulindan', '05 03 75 52 33', 'cvoisin@live.com', 1123.2 , 'FR'),
    ('Evelynn Miller','33124 Streich Valley South Burley, IA 18966-1979', '+1-383-509-0569', 'jacey.simonis@gmail.com',100 , 'US'),
    ('Adalyn Price','3056 Turcotte Throughway New Ashlyshire, NY 57111-6330','662.843.2593 x191','jane07@yahoo.com', 100000000 , 'US'),
    ('Maxime Chabot', '63, avenue Da Costa 25560 Collet' , '01 61 84 59 10', 'daniel.martinez@orange.fr', 95738.33 , 'FR'),
    ('Clara Gustafsson','Bentzen Have 22 9882 Ferritslev', '4286 1988', 'btruelsen@lauritzen.com', 230.30 , 'DK'),
    ('Ronan Morgan','4376 Fabian Pine Apt. 346 Morganhaven, OR 53861-3852','576-315-8248 x63300','jenkins.dorris@sipes.biz', 1000.50 , 'US'),
    ('Tim Rousseau','527, rue de Benoit 62140 Lebrun','+33 6 46 68 31 44','valentine.leclercq@allain.net', 2931 , 'FR'),
    ('Jessica Sjöberg', 'Jensenvej 4, 3. sal. 3309 Agerbæk', '+45 2863 0387', 'wthorsen@hotmail.com', 50203.3 , 'DK'),
    ('Valdemar Bergström', 'Damgaardshaven 3 Y, st. th.5979 Kolding', '+45 16 81 63 89','johannsen.laila@antonsen.biz' , 31230.40 , 'DK');


-- @BLOCK
drop table customers;
drop table transfers;
