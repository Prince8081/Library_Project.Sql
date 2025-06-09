create database Library_Project;

   -- Library Management System Project --
   
   -- Creating Branch Table --
   
   CREATE TABLE branch (
    Branch_id VARCHAR(10) PRIMARY KEY,
    Manager_id VARCHAR(10),
    Branch_address VARCHAR(55),
    Contact_No VARCHAR(10)
);
select * from branch ;

CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(25),
    Position VARCHAR(15),
    Salary INT,
    branch_id VARCHAR(25)
);
select * from employees ;

 CREATE TABLE books (
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(75),
    category VARCHAR(10),
    rental_price FLOAT,
    status VARCHAR(15),
    author VARCHAR(35),
    publisher VARCHAR(55)
);
select * from books ;

CREATE TABLE members (
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(25),
    member_address VARCHAR(75),
    reg_date DATE
);
select * from members ;

CREATE TABLE issued_status (
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10),
    issued_book_name VARCHAR(75),
    issued_date DATE,
    issued_book_isbn VARCHAR(25),
    issued_emp_id VARCHAR(10)
);
select * from issued_status ;

CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),
    return_book_name VARCHAR(75),
    return_date DATE,
    return_book_isbn VARCHAR(20)
);
select * from return_status ;

-- Foreign key --

alter table issued_status 
add constraint fk_members 
foreign key (issued_member_id)
references members(member_id);

alter table issued_status 
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status 
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);

alter table return_status 
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id) ;




















