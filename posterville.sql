-- CREATING THE TABLES:

CREATE DATABASE posterville;
USE posterville;

CREATE TABLE Poster (
poster_id INT NOT NULL AUTO_INCREMENT,
CONSTRAINT poster_pk PRIMARY KEY (poster_id)
);

CREATE TABLE Role (
  role_id INT NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(45) NOT NULL,
  role_desc VARCHAR(100),
  CONSTRAINT role_id_pk PRIMARY KEY (role_id)
);

CREATE TABLE User (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_fname VARCHAR(45) NOT NULL,
  user_lname VARCHAR(45) NOT NULL,
  CONSTRAINT user_id_pk PRIMARY KEY (user_id)
);

CREATE TABLE Creator (
  creator_id INT NOT NULL AUTO_INCREMENT,
  role_id INT,
  creator_fname VARCHAR(45),
  creator_lname VARCHAR(45),
  CONSTRAINT creator_pk PRIMARY KEY (creator_id),
  CONSTRAINT creator_fk1 FOREIGN KEY (role_id) REFERENCES Role (role_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Creator_Poster (
  poster_id INT NOT NULL,
  creator_id INT NOT NULL,
  CONSTRAINT poster_creator_pk PRIMARY KEY (poster_id, creator_id)
);

CREATE TABLE Medium (
medium_id INT NOT NULL AUTO_INCREMENT,
medium_name VARCHAR(50) NOT NULL,
CONSTRAINT medium_pk PRIMARY KEY (medium_id)
);

CREATE TABLE Image_Path (
image_path_id INT NOT NULL AUTO_INCREMENT,
filepath VARCHAR(256) NOT NULL,
CONSTRAINT image_path_pk PRIMARY KEY (image_path_id)
);

CREATE TABLE Origin (
origin_id INT NOT NULL AUTO_INCREMENT,
country_of_origin VARCHAR(45),
language VARCHAR(45),
CONSTRAINT origin_pk PRIMARY KEY (origin_id)
);

CREATE TABLE Poster_Location (
location_id INT NOT NULL AUTO_INCREMENT,
location_desc VARCHAR(20) NOT NULL,
CONSTRAINT poster_location_pk PRIMARY KEY (location_id)
);

CREATE TABLE Request (
request_id INT NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
poster_id INT,
request_date DATE NOT NULL,
request_status VARCHAR(20) NOT NULL,
CONSTRAINT request_pk PRIMARY KEY (request_id),
CONSTRAINT request_fk2 FOREIGN KEY (user_id)
REFERENCES User(user_id),
CONSTRAINT request_fk1 FOREIGN KEY (poster_id)
REFERENCES Poster(poster_id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Collection (
collection_id INT NOT NULL AUTO_INCREMENT,
collection_name VARCHAR(400) NOT NULL,
collection_desc VARCHAR(400),
CONSTRAINT collection_pk PRIMARY KEY (collection_id)
);

CREATE TABLE Rights_Statement (
rights_statement_id INT NOT NULL AUTO_INCREMENT,
rights_statement VARCHAR(100) NOT NULL,
CONSTRAINT rights_statement_pk PRIMARY KEY (rights_statement_id)
);

CREATE TABLE Rights_Holder (
rights_holder_id INT NOT NULL AUTO_INCREMENT,
rights_statement_id INT,
holder_fname VARCHAR(45),
holder_lname VARCHAR(45),
holder_org VARCHAR(100),
CONSTRAINT rights_holder_pk PRIMARY KEY (rights_holder_id),
CONSTRAINT rights_holder_fk FOREIGN KEY (rights_statement_id)
REFERENCES Rights_Statement (rights_statement_id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Printer (
printer_id INT NOT NULL AUTO_INCREMENT,
printer_name VARCHAR(100) NOT NULL,
city VARCHAR(45),
state VARCHAR(45),
country VARCHAR(45),
postal_code VARCHAR(20),
CONSTRAINT printer_pk PRIMARY KEY (printer_id)
);

Alter TABLE Poster ADD COLUMN creator_id INT NOT NULL;
Alter TABLE Poster ADD COLUMN medium_id INT NOT NULL;
Alter TABLE Poster ADD COLUMN printer_id INT NOT NULL;
Alter TABLE Poster ADD COLUMN image_path_id INT;
Alter TABLE Poster ADD COLUMN origin_id INT NOT NULL;
Alter TABLE Poster ADD COLUMN location_id INT NOT NULL;
Alter TABLE Poster ADD COLUMN collection_id INT NOT NULL;
Alter TABLE Poster ADD COLUMN rights_statement_id INT NOT NULL;
Alter TABLE Poster ADD COLUMN title VARCHAR(200) NOT NULL;
Alter TABLE Poster ADD COLUMN dimension VARCHAR(20) NOT NULL;
Alter TABLE Poster ADD COLUMN date_created INT;

Alter TABLE Poster ADD CONSTRAINT poster_fk1 FOREIGN KEY (creator_id)
REFERENCES Creator (creator_id)
ON DELETE CASCADE ON UPDATE CASCADE;

Alter TABLE Poster ADD CONSTRAINT poster_fk2 FOREIGN KEY (medium_id)
REFERENCES Medium (medium_id)
ON DELETE CASCADE ON UPDATE CASCADE;

Alter TABLE Poster ADD CONSTRAINT poster_fk3 FOREIGN KEY (printer_id)
REFERENCES Printer (printer_id)
ON DELETE CASCADE ON UPDATE CASCADE;

Alter TABLE Poster ADD CONSTRAINT poster_fk4 FOREIGN KEY (image_path_id)
REFERENCES Image_Path (image_path_id)
ON DELETE CASCADE ON UPDATE CASCADE;

Alter TABLE Poster ADD CONSTRAINT poster_fk5 FOREIGN KEY (origin_id)
REFERENCES Origin (origin_id)
ON DELETE CASCADE ON UPDATE CASCADE;

Alter TABLE Poster ADD CONSTRAINT poster_fk6 FOREIGN KEY (location_id)
REFERENCES Poster_Location (location_id)
ON DELETE CASCADE ON UPDATE CASCADE;

Alter TABLE Poster ADD CONSTRAINT poster_fk7 FOREIGN KEY (collection_id)
REFERENCES Collection (collection_id)
ON DELETE CASCADE ON UPDATE CASCADE;

Alter TABLE Poster ADD CONSTRAINT poster_fk8 FOREIGN KEY (rights_statement_id)
REFERENCES Rights_Statement (rights_statement_id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Creator_Poster
ADD CONSTRAINT creator_poster_fk1 FOREIGN KEY (creator_id)
REFERENCES Creator(creator_id),
ADD CONSTRAINT creator_poster_fk2 FOREIGN KEY (poster_id)
REFERENCES Poster(poster_id)
ON DELETE CASCADE ON UPDATE CASCADE;


-- INSERTING DATA INTO THE TABLES:

INSERT INTO Role (role_name, role_desc)
VALUES
('Illustrator','Making visuals from concepts'),
('Lithographer','Making visuals from lithography'),
('Painter','Creates art using paint'),
('Graphic Designer','Photograph, image, and typography assembler'),
('Artist','Multi-medium connector of thoughts and feelings through conscious skill and creativity'),
('Typographer','Text wrangler, but make it aesthetic'),
('Art Director', 'Calling the shots-artistically speaking');

INSERT INTO User (user_fname, user_lname)
VALUES
('Leila', 'Slimani'),
('Naomi', 'Owusu'),
('Dan', 'Rabinowitz'),
('Wan-Suh', 'Park'),
('Peter', 'Frankopan'),
('Jennifer', 'Hofman'),
('Umberto', 'Eco'),
('Felix', 'Gonzalez-Torres'),
('Jacky', 'Connolly'),
('David', 'Wojnarowicz'),
('Natalie', 'Bookchin'),
('Theresa', 'Duncan'),
('Peggy', 'Ahwesh'),
('Catherine', 'Opie'),
('Cindy', 'Sherman'),
('Vivian', 'Maier'),
('Nan', 'Goldin'),
('Diane', 'Arbus'),
('Nikki S.', 'Lee'),
('Jennie Louise', 'Van Der Zee'),
('Ruby', 'Washington');

INSERT INTO Creator (role_id, creator_fname, creator_lname )
VALUES
(1, 'Eugenie', 'De Land'),
(2, 'Lawrence', 'Harris'),
(1, 'Vera', 'Block'),
(3, 'Buong', 'Ang'),
(2, 'Will', 'Bradley'),
(2, 'Billy', 'Bob'),
(2, 'William', 'McKee'),
(5, 'Jameson', 'Williamson'),
(7,'Harmony', 'Trout'),
(6,'Hamish', 'Grosswood'),
(4,'Ed', 'Scallion'),
(6,'Judy', 'Whitmore'),
(7, 'Pete', 'Garbanzo'),
(4,'Julius', 'Oyasaka'),
(4, 'Annie', 'Easley'),
(1, 'Ada', 'LoveLace'),
(5, 'Timnit', 'Gebru'),
(6, 'Joy', 'Buolamwini'),
(6, 'Kay', 'McNulty'),
(4, 'Ida', 'Rhodes'),
(5, 'Dorothy', 'Vaughan');

INSERT INTO Medium (medium_name)
VALUES
('Collotype'),
('Illustration'),
('Inkjet print'),
('Lino print'),
('Lithograph'),
('Monotype'),
('Offset print'),
('Painting'),
('Screen-print'),
('Wood engraving');

INSERT INTO Image_Path (filepath)
VALUES
('https://drive.google.com/file/d/1lO734rlzAEktIFeqjkSJlXy2sQIqyQNr/view?usp=share_link'),
('https://drive.google.com/file/d/1kdTRLZBlBvoNAoewh4SsVXIbYxZeId9d/view?usp=share_link'),
('https://drive.google.com/file/d/19hSqJ3jOBysjCPSI_UzbBPOB5DiUO2NT/view?usp=share_link'),
('https://drive.google.com/file/d/1bXF0wHDx_IRHgRxXAFflQVL3Mxc2RgZ6/view?usp=share_link'),
('https://drive.google.com/file/d/1Xw0Zc-fGZMss2AUo4scu7os6oo_kJq0Q/view?usp=share_link'),
('https://drive.google.com/file/d/1lbSQyDZx8q9VJjk0UpRWoyKeDwhjoEbU/view?usp=share_link'),
('https://drive.google.com/file/d/1qMJJq-TgZuJtDMVSdEb7LpYR5XjAS2iG/view?usp=share_link'),
('https://docs.google.com/drawings/d/1sHJXLj92ZMocQzzCjdlOfxWXW79ravcYRWji0y-0MbU/edit?usp=sharing'), 
('https://docs.google.com/drawings/d/1r6tYZKbOug9NUyiK4jCp7KCo5Bo3wUQAQAoLEdE6RCQ/edit?usp=sharing'),
('https://docs.google.com/drawings/d/1nGwvQOl7i9z2p9oSatE3Qj1ynjiNUlzH5OlpUNTAkZo/edit?usp=sharing'),
('https://docs.google.com/drawings/d/1fLXGsIsWn3It8TUPZrTD6XcA-P6GCUGBPyWpoZuk4-4/edit?usp=sharing'),
('https://docs.google.com/drawings/d/1jP-OuF6XIadApEwiJa53p-DfDeTZeKdgfxPVP-_LN1s/edit?usp=sharing'),
('https://docs.google.com/drawings/d/1PcoQ2ozy420V8Q5TAQc_fzM-XC4DMLgk_PbZb4Xn4w0/edit?usp=sharing'),
('https://docs.google.com/drawings/d/1FVtBSRh1mZGdv_a0SWEAPzDUb089u8nu71r4bZ_Q_7Y/edit?usp=sharing'),
('https://drive.google.com/file/d/1IsTKmhqA01-DfdeuGaUJl0zRxJOBelD-/view?usp=share_link'),
('https://drive.google.com/file/d/1Vc-0VW9ie7kgkTUTgPsLZktgovolBgbb/view?usp=share_link'),
('https://drive.google.com/file/d/1S5cWC3wlOVPBxz2q2QPSFfW5PMKbnIsJ/view?usp=share_link'),
('https://drive.google.com/file/d/1P6mp_omAs5fl-JvE1NaOStng8NK6M8OZ/view?usp=share_link'),
('https://drive.google.com/file/d/1FO9H2WqfoSVTpmgHksStrXI6JC7WX9Yo/view?usp=share_link'),
('https://docs.google.com/drawings/d/16BCCRxLYEZozTOTGi_bwlCA-nxMfTRR-LCHSCU7SwSc/edit?usp=share_link'),
('https://drive.google.com/file/d/1fzFKLjWZCKoP-1mfzTj8Y-sCgu912MoA/view?usp=sharing');

INSERT INTO Origin (country_of_origin, language)
VALUES
('US', 'English'),
('UK', 'English'),
('Vietnam', 'Vietnamese'),
('France', 'French'),
('Italy ', 'Italian'),
('Denmark', 'Danish');

INSERT INTO Poster_Location (location_desc)
VALUES
('Reading Room'),
('Stacks');

INSERT INTO Collection (collection_name, collection_desc)
VALUES
('Library of Congress Prints and Photographs Division World War I Posters Collection', 'The Library of Congress Prints & Photographs Division makes available online approximately 1,900 World War I posters created between 1914 and 1920.'),
('Library of Congress Prints and Photographs Division Artist Posters Collection', 'The online Artist Posters consist of a small but growing proportion of the more than 85,000 posters in the Artist Poster filing series. This series highlights the work of poster artists, both identified and anonymous. It includes posters from the nineteenth century to the present day from the United States and other countries.'),
('Library of Congress Prints and Photographs Division WPA Poster Collection', 'The Work Projects Administration (WPA) Poster Collection consists of 907 posters produced from 1936 to 1943 by various branches of the WPA. Of the 2,000 WPA posters known to exist, the Library of Congress collection of more than 900 is the largest.'),
('University of Michigan Labadie Collection','The Joseph A. Labadie Collection contains posters which have been acquired over the past 100 years. This database consists of images of those posters covering social protest movements such as Anarchism, Civil Liberties, Colonialism, Communism, Ecology, Labor, Pacifism, Sexual Freedom, Socialism, Women, and Youth/Student Protest.'),
('Library of Congress Prints and Photographs Division Performing Arts Posters Collection', 'The Performing Arts posters illustrate the wide range of popular, live entertainment in America from the late nineteenth to the early twentieth century. The approximately 2,100 posters in the online Performing Arts Posters category represent the entire contents of three collections: the Magic Poster Collection, the Minstrel Poster Collection, and the Theatrical Poster Collection.'),
('Washington State University Libraries Manuscripts, Archives, and Special Collections', 'Propaganda Poster Collection'),
('American Advertising, from Olden to Golden Age', 'A collection of posters exemplifying American commercial print advertising from the late 1800s to the 1960s.'),
('You Cant Wear That', 'A comprehensive collection of attire gone wrong throughout the centuries.');

INSERT INTO Rights_Statement (rights_statement)
VALUES
('Copyright not evaluated'),
('No known copyright'),
('NO COPYRIGHT - NON-COMMERCIAL USE ONLY'),
('IN COPYRIGHT'),
('Open Access - OA'),
('CC0 1.0 Universal CC0 1.0 - Public Domain Dedication');

INSERT INTO Rights_Holder (rights_statement_id, holder_fname, holder_lname, holder_org)
VALUES
(3, NULL, NULL, 'Posterville Design Museum'),
(6, NULL, NULL, 'Posterville Design Museum'),
(4, 'Joy', 'Buolamwini', NULL),
(4, 'Kay', 'McNulty', NULL),
(4, 'Ida', 'Rhodes', NULL),
(4, 'Dorothy', 'Vaughan', NULL);

INSERT INTO Printer (printer_name, city, state, country, postal_code)
VALUES
('Graphic Sky Printing', 'Santa Fe', 'NM', 'US', '87501'),
('A&M Printing', 'Kansas City', 'MO', 'US', '64030'),
('Time Printers', 'Baltimore', 'MD', 'US', '21201'),
('NT Printing', 'Nha Trang', NULL, 'Vietnam', '336745'),
('PGH Print', 'Pittsburgh', 'PA', 'US', '15106'),
('Strobridge & Co. Lith', 'Cincinnati', 'OH', 'US', '45201'),
('Forbes', 'Boston', 'MA', 'US', '02108'),
('Philadelphia Printworks', 'Philadelphia', 'PA', 'US', '19112'),
('Baroque-coco', 'New York City', 'NY', 'US', '10002'),
('Frank Printing Co.', 'Camden', 'NJ', 'US', '08100'),
('Bowery Print Shop', 'New York City', 'NY', 'US', '10002'),
('Po-mo Ltd', 'Boston', 'MA', 'US', '02215'),
('Saltzman and Sons', 'Savannah', 'GA', 'US', '31409'),
('Dada Prints', 'Versailles', NULL, 'France', '78008'),
('Renaissance & Co', 'Rome', NULL, 'Italy', '00186'),
('Surrealist Inc', 'Copenhagen', NULL, 'Denmark', '01307'),
('Fauvist Dream Team', 'London', NULL, 'United Kingdom', 'SE1 9TG'),
('Suprematism Company', 'Danville', 'VA', 'US', '24540');

INSERT INTO Poster (creator_id, medium_id, printer_id, image_path_id, origin_id, 
location_id, collection_id, rights_statement_id, title, dimension, date_created)
VALUES
(1, 2, 1, 1, 1, 1, 1, 1,'Sunrise or Sunset Own a Liberty Bond','40 x 30 in','1917'),
(2, 5, 2, 2, 1, 2, 2, 2, 'Mon cher foyer, je t aime tu es la maison de chacun le chez soi pour tous','48 x 31 in','1918'),
(3, 9, 3, 3, 1, 1, 3, 1, 'History of civic services in the city of New York Water supply No. 1: The first public well was dug opposite the fort','8 x 10 in','1936'),
(4, 8, 4, 4, 3, 2, 4, 1, 'Le Thi Hong Gam: An example of dauntlessness and courage','14 x 16 in', '1971'),
(5, 5, 5, 5, 1, 2, 2, 2, 'Harpers Bazaar, Easter - A.D. 1896','14 x 9 in', '1896'),
(6, 5, 6, 6, 1, 1, 5, 2, 'Kellar in his latest mystery','84 x 40 in', '1898'),
(7, 5, 7, 7, 1, 2, 6, 2, 'Keep the Home Garden Going','20 x 30 in','1918'),
(8, 10, 8, 8, 1, 1, 7, 5, 'Try Dr. Jonahs Exquisite Liver Tonic','11 x 17 in', '1895'),
(9, 5, 9, 9, 1, 2, 7, 2, 'Underwood: A New Way to Type','18 x 24 in','1909'),
(10, 1, 10, 10, 1, 2, 7, 2, 'Bring Your Favorite Tunes Home with Victrola','9 x 14 in','1924'),
(11, 7, 11, 11, 1, 1, 7, 2, 'Ritz: For Thrifty Folks, Too','18 x 24 in','1937'),
(12, 5, 9, 12, 1, 2, 7, 2, 'Surprise Her with Diamonds','24 x 26 in','1946'),
(13, 6, 12, 13, 1, 2, 7, 2, 'Dentists Love Marlboro!','11 x 17 in','1952'),
(14, 9, 13, 14, 1, 1, 7, 2, 'Coca Cola: The Cosmopolitan Beverage','27 x 30 in','1960'),
(15, 9, 14, 15, 4, 2, 8, 3, 'Pas d’ustensiles','24 x 36 in','1965'),
(16, 5, 15, 16, 5, 1, 8, 5, 'Padelle Italiane','11 x 17 in','1899'),
(17, 4, 12, 17, 1, 2, 8, 6, 'UnderTea','27 x 40 in','1905'),
(18, 6, 16, 18, 6, 1, 8, 4, 'Salt og Peber Sko','24 x 36 in','1972'),
(19, 9, 9, 19, 1, 2, 8, 4, 'No Knives','18 x 24 in','1997'),
(20, 3, 17, 20, 2, 1, 8, 4, 'Fashionably Late','24 x 36 in','2020'),
(21, 6, 18, 21, 1, 2, 8, 4, 'Glass Hat','27 x 40 in','2001');

INSERT INTO Request (user_id, poster_id, request_date, request_status)
VALUES
(1, 21, '2022-10-15', 'out'),
(2, 20, '2022-11-04', 'request logged'),
(3, 19, '2022-10-24', 'returned'),
(4, 18, '2022-12-01', 'shelved'),
(5, 17, '2022-12-15', 'request logged'),
(6, 16, '2022-11-21', 'out'),
(7, 15, '2022-10-28', 'shelved'),
(8, 14, '2022-12-07', 'shelved'),
(9,13, '2022-11-08', 'request logged'),
(10, 12, '2022-11-30', 'out'),
(11, 11, '2022-12-09', 'shelved'),
(12, 10, '2022-10-21', 'request logged'),
(13, 9, '2022-10-27', 'shelved'),
(14, 8, '2022-12-02', 'shelved'),
(15, 7, '2022-10-31', 'out'),
(16, 6, '2022-11-01', 'request logged'),
(17, 5, '2022-12-11', 'returned'),
(18, 4, '2022-10-1', 'shelved'),
(19, 3, '2022-11-05', 'request logged'),
(20, 2, '2022-12-01', 'out'),
(21, 1, '2022-10-20', 'shelved');


--  SOME EXAMPLE SQL QUERIES:

-- 1) A TRIGGER - This trigger works when a poster is deleted from the Poster table. 
-- Upon deletion, it inserts a new ID, poster_id, title, datetime of change, and 
-- the action (“delete”) into a new table called Poster_audit: 
 
CREATE TABLE Poster_audit (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    poster_id INT,
    title VARCHAR(200) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
    );
 
CREATE TRIGGER poster_delete_audit 
    AFTER DELETE ON Poster
    FOR EACH ROW 
 INSERT INTO Poster_audit
 SET action = 'delete',
     poster_id = OLD.poster_id,
     title = OLD.title,
     changedat = NOW();


-- 2) Delete data:
-- Removes a deaccessioned item from the database (deletes the item):

DELETE FROM Poster
WHERE poster_id=(12);


-- 3) A TRANSACTION:
-- The museum just received a new poster and needs to enter the poster and its image filepath 
-- into the database. First add the file path value to the Image_Path and then insert new poster 
-- data into the Poster table.

START TRANSACTION;

INSERT INTO Image_Path(filepath)
VALUE ("https://docs.google.com/drawings/d/1ll5uMgu0G9uaoAcAgTb5o-uzol2OSsILlKS59y-9GFs/edit?usp=sharing");
 
INSERT INTO Poster  (creator_id, medium_id, printer_id, origin_id, image_path_id,
location_id, rights_statement_id, collection_id, title, dimension, date_created)
VALUES
(7, 3, 13, 1, 22, 2, 2, 4, "TIME TO MAKE ANOTHER POSTER", "11 x 14 in", "1900");

COMMIT;


-- 4) Joins two tables:
-- Shows users with a request status that is currently “out” (rather than “request 
-- logged,” “returned”, or “shelved”)

SELECT * from User NATURAL JOIN Request WHERE Request.request_status = 'out';


-- 5) A QUERY with a SUBQUERY:
-- Updates the location to “Reading Room” for all posters that currently have a request status of “out.”

UPDATE Poster
SET location_id = 1
WHERE poster_id IN
(SELECT poster_id
FROM Request
WHERE request_status='out');
 
 
-- 6) Updates existing data in the database:
-- If a poster has a creation date of 100 years or more before 2022,
-- update the rights statement ID to “6” (CC0 1.0 Universal (CC0 1.0) Public Domain Dedication):

UPDATE Poster
SET rights_statement_id= 6
WHERE (2022 - date_created) >= 100;
 
 
-- 7) Insert:

INSERT INTO Request (user_id, poster_id, request_date, request_status)
VALUES
(4, 1, "2022-11-13", "request logged");
 
INSERT INTO Request (user_id, poster_id, request_date, request_status)
VALUES
(15, 1, "2022-11-12", "request logged");
 
INSERT INTO Request (user_id, poster_id, request_date, request_status)
VALUES
(16, 21, "2022-11-05", "request logged");

 
-- 8) Shows all the titles of all screen-print posters in the archive:

SELECT title FROM Poster
WHERE medium_id = 9;
 
 
-- 9) Shows the title and date for the oldest poster in the archive:

SELECT title, date_created
FROM Poster
ORDER BY date_created ASC
LIMIT 1;
 
 
-- 10) Returns a list of poster IDs for all the posters currently in the Reading Room location:

SELECT poster_ID FROM Poster
WHERE location_id = 1;
 
 
-- 11) VIEW statements 

-- Shows each poster title and its printer:

CREATE VIEW poster_printer AS
SELECT title, printer_name FROM Poster, Printer WHERE Poster.printer_id = Printer.printer_id
ORDER BY printer_name ASC;
 
 
-- Shows the poster_id, title, printer_name of posters printed in Vietnam (or whatever country you change it to):

CREATE VIEW poster_printer_vietnam AS
SELECT poster_id, title, printer_name, country FROM Poster, Printer WHERE Poster.printer_id = Printer.printer_id AND Printer.country = 'Vietnam'
ORDER BY printer_name ASC;
 
 
-- Shows the poster_id, title, printer_name of posters NOT printed in the US:

CREATE VIEW poster_printer_vietnam AS
SELECT poster_id, title, printer_name, country FROM Poster, Printer WHERE Poster.printer_id = Printer.printer_id AND Printer.country <> 'US'
ORDER BY printer_name ASC;
 
 
 

 
