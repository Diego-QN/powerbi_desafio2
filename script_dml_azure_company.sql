-- Alimentação das tabelas

-- Inserindo dados na tabela employee
INSERT INTO azure_company.employee 
VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, '333445555', 5),
       ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, '888665555', 5),
       ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, '987654321', 4),
       ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, '888665555', 4),
       ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, '333445555', 5),
       ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, '333445555', 5),
       ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, '987654321', 4),
       ('James', 'E', 'Borg', '888665555', '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

-- Inserindo dados na tabela dependent
INSERT INTO azure_company.dependent 
VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
       ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
       ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
       ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
       ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
       ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
       ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

-- Inserindo dados na tabela department
INSERT INTO azure_company.department 
VALUES ('Research', 5, '333445555', '1988-05-22', '1986-05-22'),
       ('Administration', 4, '987654321', '1995-01-01', '1994-01-01'),
       ('Headquarters', 1, '888665555', '1981-06-19', '1980-06-19');

-- Inserindo dados na tabela dept_locations
INSERT INTO azure_company.dept_locations 
VALUES (1, 'Houston'),
       (4, 'Stafford'),
       (5, 'Bellaire'),
       (5, 'Sugarland'),
       (5, 'Houston');

-- Inserindo dados na tabela project
INSERT INTO azure_company.project 
VALUES ('ProductX', 1, 'Bellaire', 5),
       ('ProductY', 2, 'Sugarland', 5),
       ('ProductZ', 3, 'Houston', 5),
       ('Computerization', 10, 'Stafford', 4),
       ('Reorganization', 20, 'Houston', 1),
       ('Newbenefits', 30, 'Stafford', 4);

-- Inserindo dados na tabela works_on
INSERT INTO azure_company.works_on 
VALUES ('123456789', 1, 32.5),
       ('123456789', 2, 7.5),
       ('666884444', 3, 40.0),
       ('453453453', 1, 20.0),
       ('453453453', 2, 20.0),
       ('333445555', 2, 10.0),
       ('333445555', 3, 10.0),
       ('333445555', 10, 10.0),
       ('333445555', 20, 10.0),
       ('999887777', 30, 30.0),
       ('999887777', 10, 10.0),
       ('987987987', 10, 35.0),
       ('987987987', 30, 5.0),
       ('987654321', 30, 20.0),
       ('987654321', 20, 15.0),
       ('888665555', 20, 0.0);

-- Consultas SQL

-- Selecionar todos os dados da tabela employee
SELECT * FROM azure_company.employee;

-- Contar dependentes de cada empregado
SELECT e.Ssn, COUNT(d.Essn) 
FROM azure_company.employee e 
JOIN azure_company.dependent d ON e.Ssn = d.Essn
GROUP BY e.Ssn;

-- Selecionar todos os dados da tabela dependent
SELECT * FROM azure_company.dependent;

-- Selecionar Bdate e Address do empregado específico
SELECT Bdate, Address 
FROM azure_company.employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Selecionar todos os dados da tabela department onde Dname é 'Research'
SELECT * FROM azure_company.department WHERE Dname = 'Research';

-- Selecionar Fname, Lname, Address dos empregados do departamento 'Research'
SELECT e.Fname, e.Lname, e.Address
FROM azure_company.employee e
JOIN azure_company.department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';

-- Selecionar todos os dados da tabela project
SELECT * FROM azure_company.project;

-- Recuperar informações dos departamentos presentes em Stafford
SELECT d.Dname AS Department, d.Mgr_ssn AS Manager 
FROM azure_company.department d
JOIN azure_company.dept_locations l ON d.Dnumber = l.Dnumber
WHERE l.Dlocation = 'Stafford';

-- Concatenar nome e sobrenome dos gerentes e fornecer alias
SELECT d.Dname AS Department, CONCAT(e.Fname, ' ', e.Lname) AS Manager 
FROM azure_company.department d
JOIN azure_company.dept_locations l ON d.Dnumber = l.Dnumber
JOIN azure_company.employee e ON d.Mgr_ssn = e.Ssn;

-- Recuperar informações dos projetos em Stafford
SELECT p.* 
FROM azure_company.project p
JOIN azure_company.department d ON p.Dnum = d.Dnumber
WHERE p.Plocation = 'Stafford';

-- Recuperar informações sobre os departamentos e projetos localizados em Stafford
SELECT p.Pnumber, p.Dnum, e.Lname, e.Address, e.Bdate
FROM azure_company.project p
JOIN azure_company.department d ON p.Dnum = d.Dnumber
JOIN azure_company.employee e ON d.Mgr_ssn = e.Ssn
WHERE p.Plocation = 'Stafford';

-- Selecionar empregados que trabalham em departamentos específicos
SELECT * FROM azure_company.employee WHERE Dno IN (3, 6, 9);

-- Operadores lógicos

-- Selecionar Bdate e Address do empregado específico
SELECT Bdate, Address
FROM azure_company.employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Selecionar Fname, Lname, Address dos empregados do departamento 'Research'
SELECT e.Fname, e.Lname, e.Address
FROM azure_company.employee e
JOIN azure_company.department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';

-- Expressões e alias

-- Calcular o valor do INSS
SELECT Fname, Lname, Salary, ROUND(Salary * 0.011, 2) AS INSS 
FROM azure_company.employee;

-- Definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
SELECT e.Fname, e.Lname, 1.1 * e.Salary AS increased_sal 
FROM azure_company.employee e
JOIN azure_company.works_on w ON e.Ssn = w.Essn
JOIN azure_company.project p ON w.Pno = p.Pnumber
WHERE p.Pname = 'ProductX';

-- Concatenar nome e sobrenome dos gerentes e fornecer alias
SELECT d.Dname AS Department, CONCAT(e.Fname, ' ', e.Lname) AS Manager 
FROM azure_company.department d
JOIN azure_company.dept_locations l ON d.Dnumber = l.Dnumber
JOIN azure_company.employee e ON d.Mgr_ssn = e.Ssn;

-- Recuperar dados dos empregados que trabalham para o departamento de pesquisa
SELECT e.Fname, e.Lname, e.Address 
FROM azure_company.employee e
JOIN azure_company.department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';

-- Definindo alias para legibilidade da consulta
SELECT e.Fname, e.Lname, e.Address 
FROM azure_company.employee e
JOIN azure_company.department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';