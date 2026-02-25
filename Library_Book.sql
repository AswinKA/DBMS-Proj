//Tables creation
//student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    phone VARCHAR(15)
);

//author table
CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50)
);

//book table
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    price DECIMAL(8,2),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

//issue table
CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

//return book table
CREATE TABLE ReturnBook (
    return_id INT PRIMARY KEY,
    issue_id INT,
    return_date DATE,
    fine DECIMAL(6,2),
    FOREIGN KEY (issue_id) REFERENCES Issue(issue_id)
);

//value insertion
//for students
INSERT INTO Student VALUES
(1,'Ram','CS','9801'),
(2,'Shyam','IT','9802'),
(3,'Sita','BCA','9803'),
(4,'Gita','BBA','9804'),
(5,'Hari','CS','9805');
//for author
INSERT INTO Author VALUES
(1,'Chetan Bhagat'),
(2,'J.K Rowling'),
(3,'Dan Brown'),
(4,'Paulo Coelho'),
(5,'Robin Sharma');
//for book
INSERT INTO Book VALUES
(101,'Half Girlfriend',1,550),
(102,'Harry Potter',2,750),
(103,'Da Vinci Code',3,650),
(104,'The Alchemist',4,500),
(105,'The Kid Who Sold His Ferrari',5,600);
//for issues
INSERT INTO Issue VALUES
(1,1,101,'2026-02-01'),
(2,2,102,'2026-02-03'),
(3,3,103,'2026-02-04'),
(4,4,104,'2026-02-05'),
(5,5,105,'2026-02-06');
//for returnbook
INSERT INTO ReturnBook VALUES
(1,1,'2026-02-10',0),
(2,2,'2026-02-12',10),
(3,3,'2026-02-14',0),
(4,4,'2026-02-15',5),
(5,5,'2026-02-16',0);
// for inner join
SELECT s.name, b.title, i.issue_date
FROM Student s
INNER JOIN Issue i ON s.student_id = i.student_id
INNER JOIN Book b ON i.book_id = b.book_id;
//for left join
SELECT s.name, i.issue_id
FROM Student s
LEFT JOIN Issue i ON s.student_id = i.student_id;
//Aggregate Queries
SELECT student_id, COUNT(*) AS total_books
FROM Issue
GROUP BY student_id;
//Aggregate Queries
SELECT SUM(fine) AS total_fine, AVG(fine) AS avg_fine
FROM ReturnBook;
//Subquery
SELECT name
FROM Student
WHERE student_id IN
(SELECT student_id FROM Issue);
// view creation
CREATE VIEW Library_View AS
SELECT s.name, b.title, i.issue_date
FROM Student s
JOIN Issue i ON s.student_id = i.student_id
JOIN Book b ON i.book_id = b.book_id;
//view
SELECT * FROM Library_View;
//comit and rollback
START TRANSACTION;
INSERT INTO Student VALUES (6,'Nabin','IT','980000006');
ROLLBACK;   -Cancels insert
OR
COMMIT;     -Saves insert


