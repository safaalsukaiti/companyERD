-- DeptTable
CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    DName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

-- EmpTable
CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender CHAR(1),
    DNUM INT,
    SuperSSN INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (SuperSSN) REFERENCES Employee(SSN)
);
-- DeptManage table
CREATE TABLE DepartmentManages (
    DNUM INT PRIMARY KEY, 
    ManagerSSN INT NOT NULL,
    HireDate DATE NOT NULL,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (ManagerSSN) REFERENCES Employee(SSN)
);

-- Project table
CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    City VARCHAR(100),
    DNUM INT NOT NULL,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);


CREATE TABLE WorksOn (
    SSN INT,
    PNumber INT,
    WorkingHours DECIMAL(5,2),
    PRIMARY KEY (SSN, PNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNumber) REFERENCES Project(PNumber)
);

-- DependentTable
CREATE TABLE Dependent (
    DependentName VARCHAR(100),
    SSN INT,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    BirthDate DATE NOT NULL,
    PRIMARY KEY (DependentName, SSN),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);