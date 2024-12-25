CREATE DATABASE Assignment_v5

CREATE TABLE Author(
AuthorID nvarchar(255) PRIMARY KEY,
AuthorName nvarchar(255)
)

CREATE TABLE Publisher(
PublisherID nvarchar(255) PRIMARY KEY,
PublisherName nvarchar(255),
PublisherAddress nvarchar(255) 
)

CREATE TABLE Tag(
TagID nvarchar(255) PRIMARY KEY,
TagColour nvarchar(255),
LoanPeriod int  
)

CREATE TABLE Genre(
GenreID nvarchar(255) PRIMARY KEY,
GenreName nvarchar(255)
)

CREATE TABLE Librarian(
LibrarianID nvarchar(255) PRIMARY KEY,
LibrarianName nvarchar(255),
LibrarianContactNumber nvarchar(255),
LibrarianEmail nvarchar(255)
)

CREATE TABLE Member(
MemberID nvarchar(255) PRIMARY KEY,
FirstName nvarchar(255),
LastName nvarchar(255),
MemberAddress nvarchar(255),
MemberContactNumber nvarchar(255),
MemberEmail nvarchar(255),
MemberActiveStatus nvarchar(255),
OutstandingFine decimal(18,2),
)

CREATE TABLE Book(
ISBN nvarchar(255) PRIMARY KEY,
Title nvarchar(255),
Category nvarchar(255),
Description nvarchar(255),
TagID nvarchar(255) FOREIGN KEY REFERENCES Tag(TagID),
Loanable nvarchar(255),
PublisherID nvarchar(255) FOREIGN KEY REFERENCES Publisher(PublisherID),
PublicationYear int
)

CREATE TABLE Book_Genre(
ISBN nvarchar(255) FOREIGN KEY REFERENCES Book(ISBN),
GenreID nvarchar(255) FOREIGN KEY REFERENCES Genre(GenreID),
PRIMARY KEY (ISBN, GenreID)
)


CREATE TABLE Record(
RecordID nvarchar(255) PRIMARY KEY,
MemberID nvarchar(255) FOREIGN KEY REFERENCES Member(MemberID),
LibrarianID nvarchar(255) FOREIGN KEY REFERENCES Librarian(LibrarianID),
DateLoaned date,
)


CREATE TABLE Copy(
CopyID nvarchar(255) PRIMARY KEY,
ISBN nvarchar(255) FOREIGN KEY REFERENCES Book(ISBN),
CopyAvailability nvarchar(255)
)


CREATE TABLE Copy_Record(
RecordID nvarchar(255) FOREIGN KEY REFERENCES Record(RecordID),
CopyID nvarchar(255) FOREIGN KEY REFERENCES Copy(CopyID),
DueDate Date,
DateReturned Date,
ReturnStatus nvarchar(255),
OverdueDay int,
OverdueFine decimal(18,2),
BookDamageStatus nvarchar(255),
DamageFine decimal(18,2),
Paid nvarchar(255),
PRIMARY KEY (RecordID, CopyID)
)

CREATE TABLE Reservation(
ReservationID nvarchar(255) PRIMARY KEY,
ISBN nvarchar(255) FOREIGN KEY REFERENCES Book(ISBN),
ReserveDate Date,
PickUpStatus nvarchar(255),
PickUpDueDate Date,
MemberID nvarchar(255) FOREIGN KEY REFERENCES Member(MemberID),
LibrarianID nvarchar(255) FOREIGN KEY REFERENCES Librarian(LibrarianID)
)

CREATE TABLE Book_Author(
ISBN nvarchar(255) FOREIGN KEY REFERENCES Book(ISBN),
AuthorID nvarchar(255) FOREIGN KEY REFERENCES Author(AuthorID),
PRIMARY KEY (ISBN, AuthorID)
)


--Author
INSERT INTO Author VALUES
('A01', 'Joanne Rowling'),
('A02', 'J.R.R. Tolkien'),
('A03', 'Stephen King'),
('A04', 'Margaret Atwood'),
('A05', 'George R.R. Martin'),
('A06', 'Harper Lee'),
('A07', 'Paulo Coelho'),
('A08', 'Khaled Hosseini'),
('A09', 'Michael Crichton'),
('A10', 'Agatha Christie'),
('A11', 'Chimamanda Ngozi Adichie'),
('A12', 'Arundhati Roy'),
('A13', 'Gabriel Garcia Marquez'),
('A14', 'Salman Rushdie'),
('A15', 'Orhan Pamuk'),
('A16', 'Cooper Lee'),
('A17', 'Ernest Hemingway'),
('A18', 'F. Scott Fitzgerald'),
('A19', 'J.D. Salinger'),
('A20', 'Jane Austen'),
('A21', 'William Shakespeare'),
('A22', 'Charles Dickens'),
('A23', 'Leo Tolstoy'),
('A24', 'Fyodor Dostoevsky'),
('A25', 'Victor Hugo'),
('A26', 'Miguel de Cervantes'),
('A27', 'Gabriel Garcia Garchar'), 
('A28', 'Lee Chong Wei'),
('A29', 'George Orwell'),
('A30', 'Ray Bradbury'),
('A31', 'Kurt Vonnegut'),
('A32', 'Sunny Atwood'),
('A33', 'Harper Kent'),
('A34', 'Alice Munro'),
('A35', 'Toni Morrison'),
('A36', 'Kazuo Ishiguro'),
('A37', 'J.M. Coetzee'),
('A38', 'Milan Kundera'),
('A39', 'Naguib Mahfouz'),
('A40', 'Orhan Seth'), 
('A41', 'Joseph Roy'),
('A42', 'Isabel Allende'),
('A43', 'Khaled Mississippi'),  
('A44', 'Michael Ondaatje'),
('A45', 'Salman Rushdie'),  
('A46', 'Yann Martel'),
('A47', 'Haruki Murakami'),
('A48', 'Chimamanda Ngozi Adichie'), 
('A49', 'Colson Whitehead'),
('A50', 'Marlon James')

--Publisher
INSERT INTO Publisher VALUES
('P01','MPH Distributors (Malaysia) Sdn Bhd','Bangunan Times Publishing, Lot 6, Jalan Lengkuas, Seksyen 51, 59200 Kuala Lumpur'),
('P02','Dewan Bahasa dan Pustaka','Peti Surat 10803, Jalan Dewan Bahasa, 50700 Kuala Lumpur'),
('P03','Sasbadi Sdn Bhd','No. 31 & 33, Jalan Sungai Besi, 57100 Kuala Lumpur'),
('P04','PTS Publications & Distributors Sdn Bhd','Lot 10, Jalan 13/6A, Taman Bukit Maluri, 59100 Kuala Lumpur'),
('P05','Galeri Ilmu Sdn Bhd','104 & 105, Jalan Merbau, Seksyen 11, 40100 Shah Alam, Selangor'),
('P06','Buku Fixi Sdn Bhd','No. 1, Jalan SS 15/4G, Subang Jaya Industrial Estate, 47600 Subang Jaya, Selangor'),
('P07','Penguin Random House LLC','17 Hudson Street'),
('P08','Oxford University Press','Great Clarendon Street'),
('P09','Hachette Livre','5, rue de Palestine'),
('P10','Penguin Random House Australia Pty Ltd','179 Wells Street, South Melbourne')

--Tag
INSERT INTO Tag VALUES
('T01', 'Green', 31),
('T02', 'Yellow', 7),
('T03', 'Red', 3),
('T04', 'Black', NULL)

--Genre
INSERT INTO Genre VALUES
('G01','Children Fiction'),
('G02', 'Cookbook'),
('G03', 'Dystopian'),
('G04', 'Fantasy'),
('G05', 'Fiction'), 
('G06', 'Food Studies'), 
('G07', 'Gothic Horror'), 
('G08', 'Graphic Novel'), 
('G09', 'Biography'), 
('G10', 'History'), 
('G11', 'Immigration Fiction'), 
('G12', 'Indigenous Studies'), 
('G13', 'Literary Fiction'), 
('G14', 'Memoir'), 
('G15', 'Mystery'), 
('G16', 'Parody'), 
('G17', 'Philosophy'), 
('G18', 'Romantic Comedy'), 
('G19', 'Science'), 
('G20', 'Technology'), 
('G21', 'Thriller'), 
('G22', 'Young Adult Fiction'),
('G23', 'Horror')

--Librarian
INSERT INTO Librarian VALUES
('LB01', 'Jay Chou', '015-1565515', 'jaychou@gmail.com'),
('LB02', 'Apa Chou', '014-9996669', 'apachou@gmail.com'),
('LB03', 'Jay Apa', '015-9998877', 'jayapa@gmail.com'),
('LB04', 'Putin', '011-9911919', 'makerussiagreatagain@gmail.com'),
('LB05', 'Zelensky', '019-7474777', 'ggukraine@gmail.com'),
('LB06', 'Biden', '012-2222999', 'ggdementia@gmail.com'),
('LB07', 'Trump', '013-0001111', 'makeamericagreatagain@gmail.com'),
('LB08', 'Obama', '012-1212121', 'twinbrotherofosama@gmail.com'),
('LB09', 'Osama', '011-9999999', 'worstpilotever@gmail.com'),
('LB10', 'Lenin', '011-0000000', 'godfatherofcommunis@gmail.com'),
('LB11','Marie Curie','016-3334455','mariecurie@example.com'),
('LB12','Stephen Hawking','017-8887766','stephenhawking@example.com'),
('LB13','William Shakespeare','018-2211333','williamshakespeare@example.com'),
('LB14','Albert Einstein','019-5551122','alberteinstein@example.com'),
('LB15','Malala Yousafzai','010-6664433','malalayousafzai@example.com'),
('LB16','Leonardo da Vinci','011-9990088','leonardodavinci@example.com'),
('LB17','Jane Austen','012-1112233','janeausten@example.com'),
('LB18','Marie Kondo','013-4445566','mariekondo@example.com'),
('LB19','Neil Armstrong','014-7778899','neilarmstrong@example.com'),
('LB20','Frida Kahlo','015-0001122','fridakahlo@example.com')

--Member
INSERT INTO Member VALUES
('M01','Lee','Bro','Beach St, 10300 George Town, Penang','011-555-1234','leebro@example.com','TRUE',461),
('M02','Siti','Ahmad','Taman Melati, 58200 Kuala Lumpur','012-345-6789','sitiahmad@example.com','FALSE',NULL),
('M03','Tan','Meng','Jalan Ampang, 68000 Selangor','019-876-5432','tanmeng@example.com','TRUE',NULL),
('M04','David','Chong','Seksyen 7, 81750 Johor Bahru','016-222-1111','davidchong@example.com','FALSE',NULL),
('M05','Nur','Aishah','Kampung Air Putih, 05000 Alor Setar','018-901-2345','nuraishah@example.com','FALSE',NULL),
('M06','Lim','Pek Leng','Taman Bukit Indah, 70200 Seremban','010-456-7890','limpekleng@example.com','TRUE',NULL),
('M07','Ravindran','Nathan','Batu Caves, 68100 Selangor','014-789-0123','ravindrannathan@example.com','FALSE',NULL),
('M08','Vanessa','Goh','Sri Damansara, 57200 Kuala Lumpur','017-654-3210','vanessagoh@example.com','FALSE',NULL),
('M09','Muhammad','Hafiz','Kampung Padang, 01000 Kangar','013-210-9876','muhammadhafiz@example.com','FALSE',NULL),
('M10','Chen','Jia Li','Taman Melawati, 53100 Kuala Lumpur','011-101-1213','chenjiali@example.com','FALSE',NULL),
('M11','Alexander','Raj','Taman Tun Dr. Ismail, 60000 Kuala Lumpur','018-345-6789','alexanderraj@example.com','FALSE',NULL),
('M12','Fatin','Shukri','Permai Jaya, 81300 Skudai','019-567-8901','fatinshukri@example.com','FALSE',NULL),
('M13','Kelvin','Lee','Taman Shamelin Perkasa, 56100 Kuala Lumpur','016-890-1234','kelvinlee@example.com','FALSE',NULL),
('M14','Noraini','Hassan','Taman Daya, 81100 Johor Bahru','010-234-5678','norainihassan@example.com','FALSE',NULL),
('M15','Bernard','Fernandez','Tanjung Aru, 88000 Kota Kinabalu','014-987-0123','bernardfernandez@example.com','FALSE',NULL),
('M16','Chew','Mei Lin','Taman Perling, 81200 Johor Bahru','017-456-7890','chewmeilin@example.com','FALSE',NULL),
('M17','Azlan','Bin Ibrahim','Seberang Prai, 13700 Pulau Pinang','019-876-5432','azlanbinibrahim@example.com','FALSE',NULL),
('M18','Stephanie','Ong','Taman Tunku Abdul Rahman, 96000 Sibu','018-210-9876','stephanieong@example.com','FALSE',NULL),
('M19','Magendran','Kumar','Taman Selayang Baru, 68100 Selangor','013-345-6789','magendrankumar@example.com','FALSE',NULL),
('M20','Angelina','David','Taman Puchong Perdana, 47100 Puchong','016-567-8901','angelinadavid@example.com','FALSE',NULL),
('M21','Zakaria','Bin Abdullah','Kota Bharu, 15300 Kelantan','014-789-0123','zakariabinabdullah@example.com','FALSE',NULL),
('M22','Joyce','Tan','Taman Melaka Raya, 75400 Melaka','011-101-1213','joycetan@example.com','FALSE',NULL),
('M23','Mohammad','Yusof','Batu Pahat, 83000 Johor','019-210-9876','mohammadyusof@example.com','FALSE',NULL),
('M24','Sabrina','Wong','Taman Bkt Ria, 93350 Kuching','017-654-3210','sabrinawong@example.com','FALSE',NULL),
('M25','Vikneswaran','Alagaratnam','Seremban, 70200 Negeri Sembilan','013-567-8901','vikneswaranalagaratnam@example.com','FALSE',NULL),
('M26','Christina','Lim','Taman Sri Tebrau, 81000 Johor Bahru','010-456-7890','christinalim@example.com','FALSE',NULL),
('M27','Amirul','Hisham','Kuantan, 25300 Pahang','018-901-2345','amirulhisham@example.com','FALSE',NULL),
('M28','Evelyn','Chung','Sandakan, 90000 Sabah','014-345-6789','evelynchung@example.com','FALSE',NULL),
('M29','Baldev','Singh','Ipoh, 30350 Perak','019-876-5432','baldevsingh@example.com','FALSE',NULL),
('M30','Melissa','Goh','Miri, 98000 Sarawak','017-456-7890','melissagoh@example.com','TRUE',NULL),
('M31','Harith','Bin Idris','Alor Setar, 05000 Kedah','016-890-1234','harithbinidris@example.com','TRUE',NULL),
('M32','Deborah','Tan','Subang Jaya, 47600 Selangor','011-101-1213','deborahtan@example.com','FALSE',NULL),
('M33','Lokman','Bin Hassan','Kangar, 01000 Perlis','019-567-8901','lokmanbinhassan@example.com','FALSE',NULL),
('M34','Patricia','Wong','Kota Kinabalu, 88000 Sabah','018-210-9876','patriciawong@example.com','FALSE',NULL),
('M35','Suresh','Rajan','Klang, 41700 Selangor','013-345-6789','sureshrajan@example.com','FALSE',NULL),
('M36','Sharifah','Binti Ahmad','Petaling Jaya, 46000 Selangor','014-789-0123','sharifahbintiahmad@example.com','FALSE',NULL),
('M37','Martin','Lee','Tawau, 91000 Sabah','017-654-3210','martinlee@example.com','FALSE',NULL),
('M38','Jennifer','Ng','Butterworth, 14000 Pulau Pinang','019-210-9876','jenniferng@example.com','FALSE',NULL),
('M39','Azizan','Bin Ismail','Muar, 84000 Johor','013-567-8901','azizanbinismail@example.com','FALSE',NULL),
('M40','Catherine','Chen','Seremban, 70300 Negeri Sembilan','010-456-7890','catherinechen@example.com','FALSE',NULL),
('M41','Hafiz','Bin Abdul Rahman','Kluang, 86000 Johor','018-901-2345','hafizbinabdulrahman@example.com','FALSE',NULL),
('M42','Samantha','Goh','Bintulu, 97000 Sarawak','014-345-6789','samanthagoh@example.com','FALSE',NULL),
('M43','Premkumar','Ananda','Taiping, 34000 Perak','019-876-5432','premkumarananda@example.com','FALSE',NULL),
('M44','Eleanor','Lim','Kuching, 93000 Sarawak','017-456-7890','eleanorlim@example.com','FALSE',NULL),
('M45','Iqbal','Bin Daud','Langkawi, 07000 Kedah','016-890-1234','iqbalbindaud@example.com','FALSE',NULL),
('M46','Fiona','Tan','Shah Alam, 40000 Selangor','011-101-1213','fionatan@example.com','FALSE',NULL),
('M47','Ramlee','Bin Hassan','Melaka, 75300 Melaka','019-567-8901','ramleebinhassan@example.com','FALSE',NULL),
('M48','Angelina','Tan','Sibu, 96000 Sarawak','018-210-9876','angelinatan@example.com','FALSE',NULL),
('M49','Bernard','Hello','Sandakan, 90000 Sabah','013-345-6789','bernardhello@example.com','FALSE',NULL),
('M50','Yasmin','Binti Mohammad','Kuantan, 25700 Pahang','014-789-0123','yasminbintimohammad@example.com','FALSE',NULL);


--Book
INSERT INTO Book VALUES
('978-0-00-714917-0', 'The Wind in the Willows', 'Fiction', 'The adventures of four animal friends on the riverbank.', 'T01', 'TRUE', 'P07', '1908'),
('978-0-06-123766-4', 'Born a Crime', 'Non-Fiction', 'A comedian coming-of-age story in apartheid South Africa.', 'T02', 'TRUE', 'P09', '2016'),
('978-0-140-27840-4', 'The Ministry for the Future', 'Fiction', 'A fictional exploration of global cooperation to address climate change.', 'T03', 'TRUE', 'P09', '2020'),
('978-0-140-28327-2', 'Milkman', 'Fiction', 'A coming-of-age story set in 1980s Belfast during the Troubles.', 'T03', 'TRUE', 'P03', '2018'),
('978-0-134-61216-2', 'The Chicago Manual of Style', 'Reference', 'Essential guide to style, grammar, and punctuation.', 'T04', 'FALSE', 'P01', '2017'),
('978-0-140-43571-7', 'Pride and Prejudice and Zombies', 'Fiction', 'A mashup of Jane Austen classic novel with a zombie apocalypse.', 'T03', 'TRUE', 'P09', '2009'),
('978-0-140-80067-4', 'The Secret Garden', 'Fiction', 'A young girl discovers a magical hidden garden.', 'T02', 'TRUE', 'P07', '1911'),
('978-0-141-39857-5', 'The Adventures of Sherlock Holmes', 'Non-Fiction', 'A collection of classic Sherlock Holmes detective stories.', 'T03', 'TRUE', 'P10', '1892'),
('978-0-141-97631-9', 'The Lord of the Rings: Audiobook Trilogy', 'Non-Fiction', 'The complete Lord of the Rings trilogy narrated by a renowned audiobook performer.', 'T02', 'TRUE', 'P08', '2021'),
('978-0-141-97817-2', 'The Vegetarian', 'Fiction', 'A South Korean novel about a housewife who inexplicably stops eating meat.', 'T01', 'TRUE', 'P01', '2016'),
('978-1-482-25081-6', 'National Geographic Magazine (2023 Subscription)', 'Journals', 'Subscription to the National Geographic Magazine for 2023.', 'T04', 'FALSE', 'P02', '2023'),
('978-0-141-98052-9', 'Dune', 'Fiction', 'A sprawling space opera about a young man who becomes embroiled in a galactic struggle for power.', 'T02', 'TRUE', 'P04', '1965'),
('978-0-141-98469-8', 'Frankenstein', 'Non-Fiction', 'A scientist creation of life and the monstrous consequences.', 'T01', 'TRUE', 'P06', '1818'),
('978-0-141-98541-0', 'Sapiens: A Brief History of Humankind', 'Non-Fiction', 'Examines the history of humankind from our origins to the 21st century.', 'T01', 'TRUE', 'P01', '2011'),
('978-0-141-98598-4', 'The God of Small Things: Study Guide', 'Non-Fiction', 'A study guide to help readers analyze and understand "The God of Small Things".', 'T01', 'TRUE', 'P08', '2019'),
('978-0-143-10439-4', 'A Short History of Nearly Everything: Young Readers Edition', 'Non-Fiction', 'Adapts "A Short History of Nearly Everything" for a younger audience.', 'T01', 'TRUE', 'P07', '2013'),
('978-0-307-40797-8', 'Sapiens: A Graphic History: Young Adult Edition', 'Non-Fiction', 'A young adult edition of the graphic novel "Sapiens" for a younger audience.', 'T02', 'TRUE', 'P07', '2022'),
('978-0-307-45239-9', 'Braiding Sweetgrass', 'Non-Fiction', 'Explores the interconnectedness of nature and human life through indigenous wisdom.', 'T01', 'TRUE', 'P09', '2013'),
('978-0-307-45242-9', 'Project Hail Mary', 'Fiction', 'An amnesiac astronaut wakes up on a spaceship with no memory of his mission.', 'T01', 'TRUE', 'P07', '2021'),
('978-0-307-45561-9', 'Born a Crime: Expanded Edition', 'Non-Fiction', 'An expanded edition of "Born a Crime" with additional content from the author.', 'T01', 'TRUE', 'P10', '2018'),
('978-0-316-06613-1', 'The Hunger Games: Prequel', 'Fiction', 'A prequel to the Hunger Games trilogy, exploring a past tributes story.', 'T03', 'TRUE', 'P02', '2015'),
('978-0-316-19965-7', 'The Emperor of All Maladies: A Biography of Cancer', 'Non-Fiction', 'A history of cancer research and its impact on society.', 'T03', 'TRUE', 'P10', '2010'),
('978-0-345-40840-4', 'World War Z: An Oral History of the Zombie War', 'Non-Fiction', 'A fictional oral history of a worldwide zombie apocalypse.', 'T01', 'TRUE', 'P01', '2006'),
('978-0-345-40990-7', 'The Handmaids Tale: Graphic Novel Adaptation', 'Fiction', 'A graphic novel adaptation of "The Handmaids Tale" that captures the story visually.', 'T02', 'TRUE', 'P04', '2019'),
('978-0-345-49241-2', 'The Lord of the Rings: Box Set', 'Non-Fiction', 'The complete Lord of the Rings trilogy in a beautiful box set edition.', 'T01', 'TRUE', 'P05', '2020'),
('978-0-385-51121-4', 'The Book Thief: Illustrated Edition', 'Fiction', 'The Book Thief with beautiful illustrations throughout the story.', 'T01', 'TRUE', 'P09', '2015'),
('978-1-544-36889-7', 'Introduction to Psychology', 'Textbooks (Reference)', 'Comprehensive overview of psychological principles.', 'T04', 'FALSE', 'P03', '2022'),
('978-0-393-35223-2', 'The Art of War', 'Non-Fiction', 'A classic Chinese military treatise on strategy and tactics.', 'T02', 'TRUE', 'P06', '1998'),
('978-1-4027-5802-5', 'Sapiens: A Graphic History', 'Non-Fiction', 'Adapts "Sapiens: A Brief History of Humankind" into a graphic novel format.', 'T02', 'TRUE', 'P03', '2018'),
('978-1-4027-8833-8', 'A Short History of Nearly Everything: Teachers Edition', 'Non-Fiction', 'A teachers edition of "A Short History of Nearly Everything" with lesson plans and activities.', 'T03', 'TRUE', 'P02', '2018'),
('978-1-4059-0590-3', 'The Girl with the Dragon Tattoo', 'Non-Fiction', 'A disgraced journalist investigates the disappearance of a young woman.', 'T03', 'TRUE', 'P08', '2005'),
('978-1-4088-5032-7', 'The Martian: Large Print Edition', 'Fiction', 'A large print edition of "The Martian" for readers with visual impairments.', 'T02', 'TRUE', 'P08', '2014'),
('978-1-4088-5122-4', 'Pride and Prejudice: Annotated Edition with Critical Essays', 'Non-Fiction', '"Pride and Prejudice" with annotations and critical essays for deeper understanding.', 'T02', 'TRUE', 'P07', '2022'),
('978-1-4088-5413-8', 'The Rosie Project', 'Non-Fiction', 'A socially awkward genetics professor embarks on a quest to find love.', 'T03', 'TRUE', 'P03', '2013'),
('978-1-4088-5651-2', 'The Omnivores Dilemma', 'Non-Fiction', 'Explores the ethics and environmental impact of our food choices.', 'T03', 'TRUE', 'P09', '2006'),
('978-1-259-87831-9', 'Machine Learning for Beginners', 'Textbooks (Reference)', 'Introductory guide to the fundamentals of machine learning.', 'T04', 'FALSE', 'P04', '2021'),
('978-1-4088-5911-7', 'The Martian: Movie Tie-In Edition with Bonus Content', 'Fiction', 'The Martian with exclusive behind-the-scenes content from the movie adaptation.', 'T02', 'TRUE', 'P06', '2015'),
('978-1-4088-8204-0', 'The Martian: Audiobook', 'Fiction', 'The Martian in audiobook format, narrated by the author.', 'T02', 'TRUE', 'P04', '2014'),
('978-1-4088-8408-2', 'Project Hail Mary: Audiobook', 'Fiction', 'The audiobook version of "Project Hail Mary", narrated by Ray Porter.', 'T03', 'TRUE', 'P09', '2021'),
('978-1-4088-8593-2', 'The Ministry for the Future: Study Guide', 'Fiction', 'A study guide for "The Ministry for the Future" exploring its themes and ideas.', 'T01', 'TRUE', 'P08', '2022'),
('978-1-4088-8732-5', 'The Ministry for the Future: Special Edition with Author Interview', 'Fiction', 'A special edition of "The Ministry for the Future" with an exclusive interview with the author.', 'T03', 'TRUE', 'P03', '2023'),
('978-1-4736-1032-7', 'A Short History of Nearly Everything', 'Non-Fiction', 'A fascinating exploration of the universe, from the Big Bang to the human body.', 'T02', 'TRUE', 'P10', '2003'),
('978-1-4736-2209-2', 'Astrophysics for People in a Hurry', 'Non-Fiction', 'A concise and engaging introduction to astrophysics for a general audience.', 'T02', 'TRUE', 'P04', '2015'),
('978-1-5039-0200-7', 'The Testaments: The Handmaids Tale Sequel', 'Fiction', 'The sequel to The Handmaids Tale, revealing secrets of Gilead.', 'T01', 'TRUE', 'P04', '2019'),
('978-1-5098-3342-7', 'Pachinko', 'Fiction', 'A multigenerational saga of a Korean familys journey through Japans 20th century.', 'T03', 'TRUE', 'P07', '2017'),
('978-1-59420-419-4', 'The Namesake', 'Fiction', 'A novel about a first-generation Indian American family navigating cultural identity.', 'T01', 'TRUE', 'P01', '2003'),
('978-1-61690-022-7', 'Persepolis', 'Non-Fiction', 'A young girls experience growing up during the Iranian Revolution, told in graphic novel format.', 'T03', 'TRUE', 'P10', '2000'),
('978-1-63289-653-1', 'Milkman: E-Book', 'Fiction', 'The e-book version of "Milkman" for popular e-readers.', 'T02', 'TRUE', 'P08', '2018'),
('978-1-63289-922-0', 'Salt Fat Acid Heat: Mastering the Elements of Good Cooking', 'Non-Fiction', 'Explores the four basic elements of flavor and their role in creating delicious dishes.', 'T03', 'TRUE', 'P06', '2017'),
('LIB-SP-12345-2024', 'Solar Energy Project: A Sustainable Future', 'Student Projects', 'Student project report on the benefits of solar energy.', 'T04', 'FALSE', NULL, '2024')

--Book_Genre
INSERT INTO Book_Genre VALUES
('978-0-00-714917-0', 'G05'),
('978-0-06-123766-4', 'G05'),
('978-0-06-123766-4', 'G09'),
('978-0-06-123766-4', 'G10'),
('978-0-140-27840-4', 'G05'),
('978-0-140-28327-2', 'G02'),
('978-0-134-61216-2', 'G03'),
('978-0-140-43571-7', 'G03'),
('978-0-140-43571-7', 'G05'),
('978-0-140-43571-7', 'G21'),
('978-0-140-80067-4', 'G04'),
('978-0-141-39857-5', 'G04'),
('978-0-141-97631-9', 'G05'),
('978-0-141-97817-2', 'G05'),
('978-1-482-25081-6', 'G06'),
('978-0-141-98052-9', 'G07'),
('978-0-141-98469-8', 'G08'),
('978-0-141-98541-0', 'G10'),
('978-0-141-98598-4', 'G10'),
('978-0-307-40797-8', 'G10'),
('978-0-307-45239-9', 'G10'),
('978-0-307-45242-9', 'G10'),
('978-0-307-45561-9', 'G10'),
('978-0-316-06613-1', 'G10'),
('978-0-316-19965-7', 'G23'),
('978-0-345-40840-4', 'G11'),
('978-0-345-40990-7', 'G12'),
('978-0-345-49241-2', 'G13'),
('978-0-385-51121-4', 'G13'),
('978-1-544-36889-7', 'G14'),
('978-0-393-35223-2', 'G14'),
('978-1-4027-5802-5', 'G14'),
('978-1-4027-8833-8', 'G15'),
('978-1-4059-0590-3', 'G09'),
('978-1-4088-5032-7', 'G16'),
('978-1-4088-5122-4', 'G17'),
('978-1-4088-5413-8', 'G18'),
('978-1-4088-5651-2', 'G18'),
('978-1-259-87831-9', 'G19'),
('978-1-4088-5911-7', 'G19'),
('978-1-4088-8204-0', 'G19'),
('978-1-4088-8408-2', 'G19'),
('978-1-4088-8593-2', 'G19'),
('978-1-4088-8732-5', 'G19'),
('978-1-4736-1032-7', 'G19'),
('978-1-4736-2209-2', 'G19'),
('978-1-5039-0200-7', 'G19'),
('978-1-5098-3342-7', 'G19'),
('978-1-59420-419-4', 'G19'),
('978-1-61690-022-7', 'G19'),
('978-1-63289-653-1', 'G19'),
('978-1-63289-922-0', 'G19'),
('978-1-63289-922-0', 'G21'),
('LIB-SP-12345-2024', 'G01');


--Record
INSERT INTO Record VALUES
('LR01','M25','LB19','2023-01-03'),
('LR02','M31','LB03','2023-01-10'),
('LR03','M01','LB03','2023-01-14'),
('LR04','M01','LB04','2023-01-16'),
('LR05','M11','LB06','2023-01-21'),
('LR06','M01','LB20','2023-01-29'),
('LR07','M23','LB13','2023-02-03'),
('LR08','M14','LB12','2023-02-09'),
('LR09','M03','LB02','2023-02-13'),
('LR10','M03','LB16','2023-02-21'),
('LR11','M18','LB04','2023-02-23'),
('LR12','M34','LB14','2023-02-28'),
('LR13','M39','LB15','2023-03-01'),
('LR14','M49','LB15','2023-03-26'),
('LR15','M24','LB16','2023-03-26'),
('LR16','M13','LB20','2023-03-26'),
('LR17','M18','LB17','2023-03-27'),
('LR18','M30','LB02','2023-04-04'),
('LR19','M06','LB07','2023-04-05'),
('LR20','M41','LB12','2023-04-21'),
('LR21','M31','LB20','2023-04-29'),
('LR22','M31','LB01','2023-05-16'),
('LR23','M30','LB02','2023-05-17'),
('LR24','M30','LB03','2023-05-17'),
('LR25','M30','LB04','2023-05-22'),
('LR26','M06','LB05','2023-05-25'),
('LR27','M06','LB06','2023-05-25'),
('LR28','M06','LB07','2023-05-25'),
('LR29','M50','LB13','2023-05-25'),
('LR30','M06','LB04','2023-06-02'),
('LR31','M06','LB05','2023-06-03'),
('LR32','M06','LB06','2023-06-04'),
('LR33','M06','LB07','2023-06-05'),
('LR34','M06','LB08','2023-06-06'),
('LR35','M06','LB09','2023-06-07'),
('LR36','M30','LB10','2023-06-08'),
('LR37','M30','LB11','2023-06-09'),
('LR38','M30','LB12','2023-06-10'),
('LR39','M30','LB13','2023-06-11'),
('LR40','M30','LB14','2023-06-12'),
('LR41','M30','LB15','2023-06-13'),
('LR42','M31','LB07','2023-06-14'),
('LR43','M31','LB08','2023-06-15'),
('LR44','M31','LB09','2023-06-16'),
('LR45','M31','LB10','2023-06-17'),
('LR46','M31','LB11','2023-06-18'),
('LR47','M31','LB12','2023-06-19'),
('LR48','M31','LB13','2023-06-20'),
('LR49','M01','LB14','2023-06-21'),
('LR50','M01','LB15','2023-06-22'),
('LR51','M01','LB16','2023-06-23'),
('LR52','M01','LB17','2023-06-24'),
('LR53','M01','LB18','2023-06-25'),
('LR54','M01','LB19','2023-06-26'),
('LR55','M01','LB20','2023-06-27'),
('LR56','M03','LB01','2023-06-28'),
('LR57','M03','LB02','2023-06-29'),
('LR58','M03','LB03','2023-06-30'),
('LR59','M03','LB04','2023-07-01'),
('LR60','M03','LB05','2023-07-02'),
('LR61','M03','LB06','2023-07-03'),
('LR62','M03','LB07','2023-07-04'),
('LR63','M03','LB08','2023-07-05'),
('LR64','M39','LB17','2024-03-20'),
('LR65','M31','LB11','2024-03-25'),
('LR66','M41','LB12','2024-03-30'),
('LR67','M22','LB01','2024-03-31'),
('LR68','M22','LB01','2024-03-31'),
('LR69','M22','LB01','2024-03-31'),
('LR70','M22','LB01','2024-03-31'),
('LR71','M22','LB01','2024-03-31'),
('LR72','M10','LB11','2024-04-01'),
('LR73','M10','LB11','2024-04-01'),
('LR74','M10','LB11','2024-04-01'),
('LR75','M01','LB12','2024-04-01'),
('LR76','M09','LB09','2024-04-01'),
('LR77','M22','LB04','2024-04-02');



--Copy
INSERT INTO Copy VALUES
('C1-978-0-00-714917-0','978-0-00-714917-0', 'Available'),
('C2-978-0-00-714917-0','978-0-00-714917-0', 'Lost'),
('C3-978-0-00-714917-0','978-0-00-714917-0', 'Available'),
('C4-978-0-00-714917-0','978-0-00-714917-0', 'Lost'),
('C1-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C2-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C3-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C4-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C5-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C6-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C7-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C8-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C9-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C10-978-0-06-123766-4','978-0-06-123766-4', 'Available'),
('C1-978-0-140-27840-4','978-0-140-27840-4', 'Available'),
('C2-978-0-140-27840-4','978-0-140-27840-4', 'Available'),
('C1-978-0-140-28327-2','978-0-140-28327-2', 'Lost'),
('C2-978-0-140-28327-2','978-0-140-28327-2', 'Available'),
('C1-978-0-134-61216-2','978-0-134-61216-2', 'Available'),
('C1-978-0-140-43571-7','978-0-140-43571-7', 'Available'),
('C2-978-0-140-43571-7','978-0-140-43571-7', 'Available'),
('C1-978-0-140-80067-4','978-0-140-80067-4', 'Available'),
('C1-978-0-141-39857-5','978-0-141-39857-5','Available'),
('C2-978-0-141-39857-5','978-0-141-39857-5','Available'),
('C3-978-0-141-39857-5','978-0-141-39857-5','Available'),
('C1-978-0-141-97631-9','978-0-141-97631-9','Available'),
('C1-978-0-141-97817-2','978-0-141-97817-2','Available'),
('C1-978-1-482-25081-6','978-1-482-25081-6','Available'),
('C2-978-1-482-25081-6','978-1-482-25081-6','Available'),
('C1-978-0-141-98052-9','978-0-141-98052-9','Available'),
('C2-978-0-141-98052-9','978-0-141-98052-9','Lost'),
('C3-978-0-141-98052-9','978-0-141-98052-9','Available'),
('C4-978-0-141-98052-9','978-0-141-98052-9','Available'),
('C1-978-0-141-98469-8','978-0-141-98469-8','Available'),
('C1-978-0-141-98541-0','978-0-141-98541-0','Available'),
('C1-978-0-141-98598-4','978-0-141-98598-4','Available'),
('C2-978-0-141-98598-4','978-0-141-98598-4','Available'),
('C1-978-0-143-10439-4','978-0-143-10439-4','Available'),
('C2-978-0-143-10439-4','978-0-143-10439-4','Available'),
('C3-978-0-143-10439-4','978-0-143-10439-4','Available'),
('C4-978-0-143-10439-4','978-0-143-10439-4','Available'),
('C5-978-0-143-10439-4','978-0-143-10439-4','Available'),
('C1-978-0-307-40797-8','978-0-307-40797-8','Available'),
('C2-978-0-307-40797-8','978-0-307-40797-8','Available'),
('C1-978-0-307-45239-9','978-0-307-45239-9','Available'),
('C2-978-0-307-45239-9','978-0-307-45239-9','Available'),
('C1-978-0-307-45242-9','978-0-307-45242-9','Available'),
('C1-978-0-307-45561-9','978-0-307-45561-9','Loaned'),
('C2-978-0-307-45561-9','978-0-307-45561-9','Available'),
('C1-978-0-316-06613-1','978-0-316-06613-1','Available'),
('C1-978-0-316-19965-7','978-0-316-19965-7','Loaned'),
('C2-978-0-316-19965-7','978-0-316-19965-7','Loaned'),
('C3-978-0-316-19965-7','978-0-316-19965-7','Loaned'),
('C1-978-0-345-40840-4','978-0-345-40840-4','Available'),
('C1-978-0-345-40990-7','978-0-345-40990-7','Available'),
('C2-978-0-345-40990-7','978-0-345-40990-7','Available'),
('C3-978-0-345-40990-7','978-0-345-40990-7','Available'),
('C1-978-0-345-49241-2','978-0-345-49241-2','Available'),
('C2-978-0-345-49241-2','978-0-345-49241-2','Available'),
('C1-978-0-385-51121-4','978-0-385-51121-4','Available'),
('C1-978-1-544-36889-7','978-1-544-36889-7','Available'),
('C2-978-1-544-36889-7','978-1-544-36889-7','Available'),
('C3-978-1-544-36889-7','978-1-544-36889-7','Available'),
('C4-978-1-544-36889-7','978-1-544-36889-7','Available'),
('C5-978-1-544-36889-7','978-1-544-36889-7','Available'),
('C1-978-0-393-35223-2','978-0-393-35223-2','Loaned'),
('C1-978-1-4027-5802-5','978-1-4027-5802-5','Available'),
('C1-978-1-4027-8833-8','978-1-4027-8833-8','Available'),
('C2-978-1-4027-8833-8','978-1-4027-8833-8','Loaned'),
('C1-978-1-4059-0590-3','978-1-4059-0590-3','Available'),
('C1-978-1-4088-5032-7','978-1-4088-5032-7','Loaned'),
('C2-978-1-4088-5032-7','978-1-4088-5032-7','Available'),
('C1-978-1-4088-5122-4','978-1-4088-5122-4','Available'),
('C2-978-1-4088-5122-4','978-1-4088-5122-4','Available'),
('C3-978-1-4088-5122-4','978-1-4088-5122-4','Available'),
('C4-978-1-4088-5122-4','978-1-4088-5122-4','Lost'),
('C5-978-1-4088-5122-4','978-1-4088-5122-4','Available'),
('C1-978-1-4088-5413-8','978-1-4088-5413-8','Loaned'),
('C2-978-1-4088-5413-8','978-1-4088-5413-8', 'Available'),
('C3-978-1-4088-5413-8','978-1-4088-5413-8','Available'),
('C1-978-1-4088-5651-2','978-1-4088-5651-2','Loaned'),
('C1-978-1-259-87831-9','978-1-259-87831-9','Available'),
('C2-978-1-259-87831-9','978-1-259-87831-9','Available'),
('C1-978-1-4088-5911-7','978-1-4088-5911-7','Available'),
('C1-978-1-4088-8204-0','978-1-4088-8204-0','Available'),
('C2-978-1-4088-8204-0','978-1-4088-8204-0','Available'),
('C1-978-1-4088-8408-2','978-1-4088-8408-2','Available'),
('C1-978-1-4088-8593-2','978-1-4088-8593-2','Available'),
('C2-978-1-4088-8593-2','978-1-4088-8593-2','Available'),
('C1-978-1-4088-8732-5','978-1-4088-8732-5','Loaned'),
('C1-978-1-4736-1032-7','978-1-4736-1032-7','Available'),
('C1-978-1-4736-2209-2','978-1-4736-2209-2','Available'),
('C2-978-1-4736-2209-2','978-1-4736-2209-2','Available'),
('C3-978-1-4736-2209-2','978-1-4736-2209-2','Available'),
('C1-978-1-5039-0200-7','978-1-5039-0200-7','Available'),
('C1-978-1-5098-3342-7','978-1-5098-3342-7','Available'),
('C1-978-1-59420-419-4','978-1-59420-419-4','Available'),
('C2-978-1-59420-419-4','978-1-59420-419-4','Available'),
('C1-978-1-61690-022-7','978-1-61690-022-7','Available'),
('C1-978-1-63289-653-1','978-1-63289-653-1','Available'),
('C1-978-1-63289-922-0','978-1-63289-922-0','Available'),
('C2-978-1-63289-922-0','978-1-63289-922-0','Available'),
('C3-978-1-63289-922-0','978-1-63289-922-0','Available'),
('C1-LIB-SP-12345-2024','LIB-SP-12345-2024','Available');


--Copy_Record
INSERT INTO Copy_Record VALUES
('LR01','C4-978-0-06-123766-4','2023-01-10','2023-01-10','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR02','C1-978-1-4736-1032-7','2023-01-10','2023-01-13','TRUE',3,7,'Minor',10,'TRUE'),
('LR03','C4-978-0-06-123766-4','2023-01-21','2023-01-21','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR03','C1-978-0-141-39857-5','2023-01-17','2023-01-22','TRUE',5,14,NULL,NULL,'FALSE'),
('LR03','C1-978-1-4736-1032-7','2023-01-21','2023-01-21','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR03','C7-978-0-06-123766-4','2023-01-21','2023-01-21','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR03','C1-978-1-4059-0590-3','2023-01-17','2023-01-17','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR03','C2-978-0-06-123766-4','2023-01-21','2023-01-21','TRUE',NULL,NULL,'Minor',20,'FALSE'),
('LR03','C4-978-0-00-714917-0','2023-02-14',NULL,'FALSE',30,0,'Lost',55,'FALSE'),
('LR03','C3-978-0-141-39857-5','2023-01-17','2023-01-17','TRUE',NULL,NULL,'Minor',6,'FALSE'),
('LR03','C4-978-1-4088-5122-4','2023-01-21',NULL,'TRUE',NULL,NULL,'Lost',300,'FALSE'),
('LR03','C4-978-0-143-10439-4','2023-01-21','2023-01-21','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR04','C1-978-1-4088-5032-7','2023-01-23','2023-02-02','TRUE',10,12,'Minor',6,'TRUE'),
('LR04','C1-978-1-5098-3342-7','2023-01-19','2023-01-19','TRUE',NULL,NULL,'Minor',6,'TRUE'),
('LR04','C4-978-0-143-10439-4','2023-02-16','2023-02-16','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR05','C8-978-0-06-123766-4','2023-02-21','2023-02-21','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR05','C1-978-0-140-27840-4','2023-01-24','2023-01-24','TRUE',NULL,NULL,'Major',25,'TRUE'),
('LR06','C4-978-0-143-10439-4','2023-03-01','2023-03-01','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C1-978-0-06-123766-4','2023-02-10','2023-02-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C2-978-0-06-123766-4','2023-02-10','2023-02-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C3-978-0-06-123766-4','2023-02-10','2023-02-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C4-978-0-06-123766-4','2023-02-10','2023-02-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C5-978-0-06-123766-4','2023-02-10','2023-02-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C6-978-0-06-123766-4','2023-02-10','2023-02-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C7-978-0-06-123766-4','2023-02-10','2023-02-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR07','C2-978-0-345-40990-7','2023-02-10','2023-02-10','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR08','C1-978-0-00-714917-0','2023-03-12','2023-03-12','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR09','C2-978-1-4088-5122-4','2023-02-20','2023-02-20','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR10','C2-978-0-307-40797-8','2023-02-28','2023-02-28','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR10','C1-978-0-307-40797-8','2023-02-28','2023-02-28','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR10','C4-978-0-143-10439-4','2023-03-24','2023-03-24','TRUE',NULL,NULL,'Major',25,'TRUE'),
('LR10','C3-978-0-143-10439-4','2023-03-24','2023-03-24','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR10','C2-978-0-140-43571-7','2023-02-24','2023-02-24','TRUE',NULL,NULL,'Major',15,'TRUE'),
('LR11','C1-978-1-63289-922-0','2023-02-26','2023-02-26','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR12','C2-978-0-307-45561-9','2023-03-31','2023-03-31','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR13','C2-978-0-307-40797-8','2023-03-08','2023-03-28','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR13','C1-978-0-307-40797-8','2023-03-08','2023-03-24','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR13','C1-978-1-4088-8408-2','2023-03-04','2023-03-24','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR13','C1-978-0-307-45239-9','2023-04-01','2023-04-21','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR14','C2-978-0-307-45561-9','2023-04-26','2023-04-26','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR14','C1-978-0-06-123766-4','2023-04-02','2023-03-27','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR14','C2-978-0-06-123766-4','2023-04-02','2023-03-27','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR14','C3-978-0-06-123766-4','2023-04-02','2023-03-27','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR14','C4-978-0-06-123766-4','2023-04-02','2023-03-27','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR14','C5-978-0-06-123766-4','2023-04-02','2023-03-27','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR14','C6-978-0-06-123766-4','2023-04-02','2023-03-27','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR15','C2-978-1-4088-8204-0','2023-04-02','2023-04-02','TRUE',NULL,NULL,'Major',50,'TRUE'),
('LR16','C2-978-1-4088-5032-7','2023-04-02','2023-04-02','TRUE',NULL,NULL,'Minor',20,'TRUE'),
('LR16','C2-978-0-307-45561-9','2023-04-26','2023-04-26','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR16', 'C2-978-1-4736-2209-2', '2023-04-26', '2023-04-26', 'TRUE', NULL, NULL, 'Minor', 10, 'TRUE'),
('LR16', 'C9-978-0-06-123766-4', '2023-04-02', '2023-04-02', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR17', 'C5-978-1-4088-5122-4', '2023-04-03', '2023-04-03', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR18', 'C3-978-1-4088-5122-4', '2023-04-11', '2023-04-11', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR18', 'C2-978-1-63289-922-0', '2023-04-07', '2023-04-07', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR18', 'C10-978-0-06-123766-4', '2023-04-11', '2023-04-11', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR18', 'C2-978-1-4088-5122-4', '2023-04-11', '2023-04-11', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR18', 'C2-978-1-59420-419-4', '2023-05-05', '2023-05-05', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR18', 'C2-978-0-316-19965-7', '2023-04-07', '2023-04-07', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C1-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C2-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C3-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C4-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C5-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C6-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C7-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C8-978-0-06-123766-4', '2023-04-12', '2023-04-06', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR19', 'C3-978-1-63289-922-0', '2023-04-08', '2023-04-08', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR20', 'C2-978-0-140-28327-2', '2023-04-24', '2023-04-24', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR21', 'C2-978-0-00-714917-0', '2023-05-30', NULL, 'FALSE', NULL, NULL, 'Lost', 55, 'TRUE'),
('LR22', 'C1-978-0-06-123766-4', '2023-05-23', '2023-06-02', 'TRUE', 10, 14, NULL, NULL, 'TRUE'),
('LR23', 'C2-978-0-06-123766-4', '2023-05-24', '2023-06-03', 'TRUE', 10, 14, NULL, NULL, 'TRUE'),
('LR24', 'C3-978-0-06-123766-4', '2023-05-24', '2023-06-03', 'TRUE', 10, 14, NULL, NULL, 'TRUE'),
('LR25', 'C4-978-0-06-123766-4', '2023-05-29', '2023-06-08', 'TRUE', 10, 14, NULL, NULL, 'TRUE'),
('LR26', 'C5-978-0-06-123766-4', '2023-06-01', '2023-06-11', 'TRUE', 10, 14, NULL, NULL, 'TRUE'),
('LR27', 'C6-978-0-06-123766-4', '2023-06-01', '2023-06-11', 'TRUE', 10, 14, NULL, NULL, 'TRUE'),
('LR28', 'C7-978-0-06-123766-4', '2023-06-01', '2023-06-11', 'TRUE', 10, 14, NULL, NULL, 'TRUE'),
('LR29', 'C1-978-1-4088-5122-4', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C2-978-1-4088-5122-4', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C3-978-1-4088-5122-4', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C5-978-1-4088-5122-4', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C8-978-0-06-123766-4', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C9-978-0-06-123766-4', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C1-978-1-4736-2209-2', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C1-978-1-63289-653-1', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR29', 'C2-978-1-4736-2209-2', '2023-06-01', '2023-06-01', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR30', 'C1-978-0-140-80067-4', '2023-06-09', '2023-06-03', 'TRUE', NULL, NULL, NULL, NULL, NULL),
('LR31','C3-978-0-141-39857-5','2023-06-06','2023-06-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR32','C1-978-0-307-45242-9','2023-07-05','2023-06-05','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR33','C2-978-0-141-98052-9','2023-06-12','2023-06-06','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR34','C1-978-0-141-98541-0','2023-07-07','2023-06-07','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR35','C3-978-0-143-10439-4','2023-07-08','2023-06-08','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR36','C1-978-0-140-80067-4','2023-06-15','2023-06-09','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR37','C2-978-0-141-39857-5','2023-06-12','2023-06-10','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR38','C2-978-1-59420-419-4','2023-07-11','2023-06-11','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR39','C1-978-1-63289-653-1','2023-06-18','2023-06-12','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR40','C1-978-1-63289-922-0','2023-06-15','2023-06-13','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR41','C1-978-1-4736-1032-7','2023-06-20','2023-06-14','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR42','C1-978-0-141-39857-5','2023-06-17','2023-06-15','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR43','C1-978-0-140-80067-4','2023-06-22','2023-06-16','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR44','C2-978-0-140-27840-4','2023-06-19','2023-06-17','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR45','C2-978-0-140-43571-7','2023-06-20','2023-06-18','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR46','C1-978-1-4088-8593-2','2023-07-19','2023-06-19','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR47','C2-978-0-141-98598-4','2023-07-20','2023-06-20','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR48','C1-978-0-345-49241-2','2023-07-21','2023-06-21','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR49','C2-978-0-141-39857-5','2023-06-24','2023-06-22','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR50','C1-978-0-140-80067-4','2023-06-29','2023-06-23','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR51','C7-978-0-06-123766-4','2023-06-30','2023-06-24','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR52','C1-978-0-140-27840-4','2023-06-27','2023-06-25','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR53','C1-978-0-140-43571-7','2023-06-28','2023-06-26','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR54','C2-978-0-143-10439-4','2023-07-27','2023-06-27','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR55','C1-978-0-141-98598-4','2023-07-28','2023-06-28','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR56','C3-978-0-141-39857-5','2023-07-01','2023-06-29','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR57','C2-978-0-143-10439-4','2023-07-30','2023-06-30','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR58','C3-978-0-345-40990-7','2023-07-07','2023-07-01','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C1-978-0-141-98052-9','2023-07-08','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C1-978-0-143-10439-4','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C2-978-0-143-10439-4','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C3-978-0-143-10439-4','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C4-978-0-143-10439-4','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C5-978-0-143-10439-4','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C1-978-0-345-40990-7','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C2-978-0-345-40990-7','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR59','C3-978-0-345-40990-7','2023-08-01','2023-07-02','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR60','C1-978-0-140-80067-4','2023-07-09','2023-07-03','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR61','C1-978-1-4027-8833-8','2023-07-06','2023-07-04','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR62','C1-978-1-4088-5911-7','2023-07-11','2023-07-05','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR63','C1-978-1-4088-8593-2','2023-07-08','2023-07-06','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR63','C2-978-0-143-10439-4','2023-08-05','2023-07-06','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR63','C3-978-0-143-10439-4','2023-08-05','2023-07-06','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR63','C4-978-0-143-10439-4','2023-08-05','2023-07-06','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR63','C1-978-0-345-40990-7','2023-07-12','2023-07-06','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR64','C1-978-0-307-40797-8','2024-03-27','2024-03-28','TRUE',NULL,NULL,NULL,NULL,NULL),
('LR64','C1-978-0-140-28327-2','2024-03-23',NULL,'FALSE',NULL,NULL,'Lost',220,'TRUE'),
('LR64','C2-978-0-141-98052-9','2024-03-27',NULL,'FALSE',NULL,NULL,'Lost',110,'TRUE'),
('LR65','C3-978-1-4088-5122-4','2024-04-01','2024-04-10','TRUE',9,13,NULL,NULL,'TRUE'),
('LR65','C1-978-0-307-45561-9','2024-04-25',NULL,'FALSE',NULL,NULL,NULL,NULL,NULL),
('LR66','C1-978-0-393-35223-2','2024-04-06',NULL,'FALSE',NULL,NULL,NULL,NULL,NULL),
('LR67','C1-978-1-4088-5413-8','2024-04-03',NULL,'FALSE',13,22,NULL,NULL,'FALSE'),
('LR68','C1-978-1-4088-5651-2','2024-04-03',NULL,'FALSE',13,22,NULL,NULL,'FALSE'),
('LR69','C1-978-1-4088-8732-5','2024-04-03',NULL,'FALSE',13,22,NULL,NULL,'FALSE'),
('LR70','C1-978-1-61690-022-7','2024-04-03','2024-04-04','TRUE',1,10,NULL,NULL,'TRUE'),
('LR71','C2-978-1-4088-5413-8','2024-04-03','2024-04-04','TRUE',1,10,NULL,NULL,'TRUE'),
('LR72','C1-978-0-316-19965-7','2024-04-04','2024-04-05','TRUE',1,10,NULL,NULL,'TRUE'),
('LR73','C2-978-0-316-19965-7','2024-04-04','2024-04-05','TRUE',1,10,NULL,NULL,'TRUE'),
('LR74','C3-978-0-316-19965-7','2024-04-04','2024-04-05','TRUE',1,10,NULL,NULL,'TRUE'),
('LR75','C2-978-1-4027-8833-8','2024-04-04',NULL,'FALSE',13,22,NULL,NULL,'FALSE'),
('LR76','C1-978-1-4088-5032-7','2024-04-08',NULL,'FALSE',13,17,NULL,NULL,'FALSE'),
('LR77','C1-978-1-4088-8204-0','2024-04-09','2024-04-10','TRUE',1,10,NULL,NULL,'TRUE');



--Book_Author
INSERT INTO Book_Author VALUES
('978-0-00-714917-0','A01'),
('978-0-06-123766-4','A04'),
('978-0-140-27840-4', 'A23'),
('978-0-140-28327-2', 'A19'),
('978-0-134-61216-2', 'A46'),
('978-0-134-61216-2', 'A04'),
('978-0-140-43571-7', 'A16'),
('978-0-140-43571-7', 'A01'),
('978-0-140-80067-4', 'A20'),
('978-0-141-39857-5', 'A31'),
('978-0-141-97631-9', 'A49'),
('978-0-141-97817-2', 'A02'),
('978-1-482-25081-6', 'A41'),
('978-0-141-98052-9', 'A43'),
('978-0-141-98469-8', 'A50'),
('978-0-141-98541-0', 'A24'),
('978-0-141-98598-4', 'A28'),
('978-0-143-10439-4', 'A06'),
('978-0-307-40797-8', 'A22'),
('978-0-307-45239-9', 'A11'),
('978-0-307-45242-9', 'A36'),
('978-0-307-45561-9', 'A13'),
('978-0-316-06613-1', 'A47'),
('978-0-316-19965-7', 'A25'),
('978-0-345-40840-4', 'A48'),
('978-0-345-40990-7', 'A40'),
('978-0-345-49241-2', 'A42'),
('978-0-385-51121-4', 'A44'),
('978-1-544-36889-7', 'A33'),
('978-0-393-35223-2', 'A14'),
('978-1-4027-5802-5', 'A45'),
('978-1-4027-8833-8', 'A21'),
('978-1-4059-0590-3', 'A38'),
('978-1-4088-5032-7', 'A03'),
('978-1-4088-5122-4', 'A08'),
('978-1-4088-5413-8', 'A37'),
('978-1-4088-5651-2', 'A17'),
('978-1-259-87831-9', 'A10'),
('978-1-4088-5911-7', 'A26'),
('978-1-4088-8204-0', 'A27'),
('978-1-4088-8408-2', 'A32'),
('978-1-4088-8593-2', 'A12'),
('978-1-4088-8732-5', 'A15'),
('978-1-4736-1032-7', 'A09'),
('978-1-4736-2209-2', 'A05'),
('978-1-5039-0200-7', 'A30'),
('978-1-5098-3342-7', 'A34'),
('978-1-59420-419-4', 'A07'),
('978-1-61690-022-7', 'A29'),
('978-1-63289-653-1', 'A39'),
('978-1-63289-922-0', 'A18'),
('LIB-SP-12345-2024', 'A35')

INSERT INTO Reservation VALUES
('R01','978-0-345-40990-7','2023-02-01', 'TRUE', '2023-02-06', 'M23', 'LB03'),
('R02','978-0-307-40797-8','2023-02-20', 'TRUE', '2023-02-25', 'M03', 'LB01'),
('R03','978-0-307-40797-8','2023-02-20', 'TRUE', '2023-02-25', 'M03', 'LB01'),
('R04','978-0-307-40797-8','2023-02-23', 'TRUE', '2023-03-05', 'M39', 'LB02'),
('R05','978-0-307-40797-8','2023-02-23', 'TRUE', '2023-03-05', 'M39', 'LB02'),
('R06','978-1-4088-8408-2','2023-02-28', 'TRUE', '2023-03-05', 'M39', 'LB04'),
('R07','978-1-59420-419-4','2023-04-03', 'TRUE', '2023-04-08', 'M30', 'LB04'),
('R08','978-0-316-19965-7','2023-04-03', 'TRUE', '2023-04-08', 'M30', 'LB05'),
('R09','978-0-316-19965-7','2023-04-04', 'TRUE', '2023-04-12', 'M10', 'LB05'),
('R10','978-1-63289-922-0','2023-04-04', 'TRUE', '2023-04-09', 'M30', 'LB06'),
('R11','978-0-140-28327-2','2023-05-05', 'FALSE', '2023-05-10', 'M10', 'LB07'),
('R12','978-1-4736-2209-2','2023-05-12', 'TRUE', '2023-05-17', 'M50', 'LB07'),
('R13','978-0-140-28327-2','2023-06-05', 'FALSE', '2023-06-10', 'M50', 'LB09'),
('R14','978-0-140-28327-2','2023-07-05', 'FALSE', '2023-07-10', 'M50', 'LB08'),
('R15','978-0-307-45561-9','2024-03-24', 'FALSE', '2024-03-29', 'M31', 'LB01'),
('R16','978-0-393-35223-2','2024-03-31', 'FALSE', NULL, 'M03', 'LB01'),
('R17','978-0-307-40797-8','2024-04-01', 'FALSE', '2024-04-06', 'M41', 'LB09'),
('R18','978-0-307-45561-9','2024-04-01', 'FALSE', '2024-04-06', 'M41', 'LB09');


--Q1 List all the members' first name, last name, and total number of books currently on loan.
--The results are sorted in alphabetical order of numbers' first name.
SELECT m.Firstname, m.LastName, COUNT(*) as 'Number of Book On loaned' FROM Member m
JOIN Record r ON m.MemberID = r.MemberID
JOIN Copy_record cr ON r.RecordID = cr.RecordID
JOIN Copy c ON cr.CopyID = c.CopyID
WHERE c.CopyAvailability = 'Loaned' AND cr.DateReturned IS NULL
GROUP BY m.Firstname, m.LastName
ORDER BY m.Firstname ASC

--Q2 Display the active members and list od books they have borrowed in year 2023.
--the result must consist of members' first name, last name, book name, and the borrow date.
--sort the result by borrow date in ascending order.
SELECT m.MemberID, m.FirstName, m.LastName, b.Title, b.ISBN, r.DateLoaned FROM Member m
JOIN Record r ON m.MemberID = r.MemberID
JOIN Copy_Record cr ON r.RecordID = cr.RecordID
JOIN Copy c ON c.CopyID = cr.CopyID
JOIN Book b ON b.ISBN = c.ISBN
WHERE MemberActiveStatus = 'TRUE' AND YEAR(r.DateLoaned) = 2023

--Q3 show members who had paid overdue more than 2 times
--the results must consist of their first name, last name, contact number, number of overdue, and total due amount
SELECT m.FirstName, m.LastName, m.MemberContactNumber, COUNT(cr.RecordID) AS NumberOfOverdues, SUM(cr.OverdueFine) AS TotalDueAmount
FROM Member m
JOIN Record r ON m.MemberID = r.MemberID
JOIN Copy_Record cr ON r.RecordID = cr.RecordID
WHERE cr.Paid = 'TRUE' AND cr.OverdueDay > 0
GROUP BY m.FirstName, m.LastName, m.MemberContactNumber
HAVING COUNT(cr.RecordID) > 2

--Q4 display the name and description of the book borrowed most in each tah color.
--sort the result by tag color in descending order.
SELECT t.TagColour, b.Title, b.Description FROM Tag t
JOIN Book b ON t.TagID = b.TagID
JOIN Copy c ON b.ISBN = c.ISBN
JOIN Copy_Record cr ON c.CopyID = cr.CopyID
WHERE cr.DateReturned IS NOT NULL AND
(SELECT COUNT(*) FROM Copy_Record cr2	--subquery1: to count the number of loan for each book (1 result looping 34 times)
JOIN Copy c2 ON cr2.CopyID = c2.CopyID
WHERE c2.ISBN = c.ISBN AND cr2.DateReturned IS NOT NULL)	-- to filter the result of subquery1 that have same result from the query
=										--to find the book with most loan count from each tag by select the result that have same loan count returned from both subquery
(SELECT MAX(LoanCount) FROM				--subquery2: to count the maximum loan count of each tag (Y:38 G:16 R:7)
(SELECT COUNT(*) AS LoanCount FROM Copy_Record cr3
JOIN Copy c3 ON cr3.CopyID = c3.CopyID
JOIN Book b3 ON c3.ISBN = b3.ISBN
WHERE cr3.DateReturned IS NOT NULL AND b3.TagID = t.TagID	--to ensure all tag is selected
GROUP BY c3.ISBN)
AS SubQuery)
GROUP BY t.TagColour, b.Title, b.Description
ORDER BY t.TagColour DESC;

--Checking
SELECT t.TagColour,b.ISBN,b.Title, COUNT(b.ISBN) AS TimesBorrowed
      FROM Copy_Record cr
	  JOIN Copy c ON c.CopyID = cr.CopyID
	  JOIN Book b ON b.ISBN= c.ISBN
	  JOIN Tag t ON t.TagID=b.TagID
      GROUP BY t.TagColour,b.ISBN,b.Title
	  ORDER BY TimesBorrowed DESC

--Q5 show the percentage o total books on loan by month in year 2023
SELECT MONTH(r.DateLoaned) AS LoanMonth, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM COPY) AS PercentageOfBooksOnLoan
FROM Record r
JOIN Copy_Record cr ON r.RecordID = cr.RecordID
WHERE YEAR(r.DateLoaned) = 2023
GROUP BY MONTH(r.DateLoaned);

--Q6
SELECT MONTH(ReserveDate) AS ReserveMonth, COUNT(*) AS TotalBooksReserved
FROM Reservation
WHERE YEAR(ReserveDate) = 2023
GROUP BY MONTH(ReserveDate);

--Q7
SELECT TOP 1 p.PublisherName
FROM Publisher p
JOIN Book b ON p.PublisherID = b.PublisherID
JOIN Tag t ON b.TagID = t.TagID
WHERE t.TagColour = 'Yellow'
GROUP BY p.PublisherName
ORDER BY COUNT(b.ISBN) ASC;

--Q8
SELECT a.AuthorName, t.TagColour, COUNT(ba.ISBN) AS NumberOfBooks
FROM Author a
JOIN Book_Author ba ON a.AuthorID = ba.AuthorID
JOIN Book b ON ba.ISBN = b.ISBN
JOIN Tag t ON b.TagID = t.TagID
GROUP BY a.AuthorName, t.TagColour;

--Q9
SELECT m.FirstName, m.LastName, m.MemberContactNumber 
FROM Member m 
JOIN Record r ON m.MemberID = r.MemberID 
JOIN Copy_Record cr ON r.RecordID = cr.RecordID 
JOIN Copy c ON c.CopyID = cr.CopyID 
JOIN Book b ON b.ISBN = c.ISBN
JOIN Book_Genre bg ON b.ISBN = bg.ISBN
JOIN Genre g ON bg.GenreID = g.GenreID 
WHERE g.GenreName = 'Fantasy' 
GROUP BY m.FirstName, m.LastName, m.MemberContactNumber

--Q10
SELECT p.PublisherName, p.PublisherAddress
FROM Publisher p
JOIN Book b ON p.PublisherID = b.PublisherID
GROUP BY p.PublisherName, p.PublisherAddress
HAVING COUNT(b.ISBN) > 4;

--Checking
SELECT COUNT(b.ISBN), p.PublisherName, p.PublisherAddress
FROM Publisher p
JOIN Book b ON p.PublisherID = b.PublisherID
GROUP BY p.PublisherName, p.PublisherAddress

