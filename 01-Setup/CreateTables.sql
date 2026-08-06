USE AzurePerformanceLab;
GO

-- Departments table
CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL
);

-- Employees table
CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2),
    HireDate DATE,

    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

PRINT 'Tables created successfully.';
GO
