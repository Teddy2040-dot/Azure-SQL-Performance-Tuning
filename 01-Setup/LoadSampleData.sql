USE AzurePerformanceLab;
GO

-- Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'Information Technology'),
(2, 'Human Resources'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');
GO

-- Insert Employees
INSERT INTO Employees
(
    FirstName,
    LastName,
    Email,
    DepartmentID,
    Salary,
    HireDate
)
VALUES
('John','Smith','john.smith@company.com',1,85000,'2022-01-15'),
('Sarah','Johnson','sarah.johnson@company.com',2,65000,'2021-05-10'),
('Michael','Brown','michael.brown@company.com',3,92000,'2020-09-20'),
('Emily','Davis','emily.davis@company.com',4,72000,'2023-02-01'),
('David','Wilson','david.wilson@company.com',5,78000,'2021-11-18');
GO

PRINT 'Sample data inserted successfully.';
GO
