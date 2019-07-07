CREATE TABLE EMPLOYEE( Fname		VARCHAR(20)		NOT NULL,
Minit		CHAR, 
Lname     		VARCHAR(20)		NOT NULL, 
Ssn			CHAR(9)		NOT NULL, 
Bdate		DATE, 
 Address		VARCHAR(100), 
Sex			CHAR, 
Salary		DECIMAL(20,5),	
Super_ssn		CHAR(9), 
Dno			INT			NOT NULL, 
CONSTRAINT EMPLOYEEPK
PRIMARY KEY(Ssn));
CREATE TABLE DEPARTMENT(Dname		 VARCHAR(30)		NOT NULL, 
          Dnumber		 INT 			NOT NULL, 
          Mgr_ssn 		 CHAR(9)		NOT NULL, 
          Mgr_start_date 	 DATE, 
          CONSTRAINT 	 DEPARTMENTPK 
          PRIMARY KEY(Dnumber), 
          CONSTRAINT 	 DEPARTMENTSK 
          UNIQUE(Dname), 
          CONSTRAINT  	 DEPARTMENTFK 
          FOREIGN KEY(Mgr_ssn) REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE);

CREATE TABLE DEPT_LOCATIONS(Dnumber 	INT 			NOT NULL, 
   Dlocation 	VARCHAR(15) 		NOT NULL, 
   CONSTRAINT  DEPT_LOCATIONSPK
   PRIMARY KEY(Dnumber, Dlocation), 
   CONSTRAINT  DEPT_LOCATIONSFK
   FOREIGN KEY(Dnumber) REFERENCES DEPARTMENT(Dnumber) ON   DELETE CASCADE);


CREATE TABLE PROJECT(Pname 			VARCHAR(20) 		NOT NULL, 
Pnumber 		INT 			NOT NULL, 
Plocation 		VARCHAR(50), 
Dnum 			INT 			NOT NULL,
CONSTRAINT PROJECTPK
PRIMARY KEY(Pnumber), 
CONSTRAINT PROJECTSK
UNIQUE(Pname), 
CONSTRAINT PROJECTFK
FOREIGN KEY(Dnum) REFERENCES DEPARTMENT(Dnumber) ON DELETE CASCADE);




CREATE TABLE WORKS_ON(Essn 		CHAR(9) 		NOT NULL, 
       Pno			INT 			NOT NULL, 
       Hours 		DECIMAL(3,1) 		NOT NULL,
       CONSTRAINT WORKS_ONPK
       PRIMARY KEY(Essn, Pno), 
       CONSTRAINT WORKS_ONFK
       FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE, 
       CONSTRAINT WORK_ONFK1
       FOREIGN KEY(Pno) REFERENCES PROJECT(Pnumber) ON DELETE CASCADE);

CREATE TABLE DEPENDENT( Essn 			CHAR(9) 		NOT NULL, 
        Dependent_name 		VARCHAR(30) 		NOT NULL, 
        Sex 			CHAR, 
        Bdate 			DATE, 
        Relationship 		VARCHAR(10),
        CONSTRAINT DEPENDENTPK 
        PRIMARY KEY(Essn, Dependent_name), 
        CONSTRAINT DEPENDENTFK 
        FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE);
        
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('John', 'B', 'Smith', '123456789' , TO_DATE('1965-01-09','YYYY-MM-DD'), '731 Fondren, Houston, TX','M', '3000', '333445555', '5');
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('Franklin', 'T', 'Wong', '333445555', TO_DATE('1955-12-08','YYYY-MM-DD'), '638 Voss, Houston, TX', 'M', '40000', '888665555','5');
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('Alicia', 'J', 'Zelaya', '999887777', TO_DATE('1968-01-19','YYYY-MM-DD'), '3321 Castle, Spring, TX', 'F', '25000', '987654321','4');
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('Jennifer', 'S', 'Wallace', '987654321', TO_DATE('1941-06-20','YYYY-MM-DD'), '291 Berry, Bellaire, TX', 'F', '43000', '888665555','4');
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('Ramesh', 'K', 'Narayan', '666884444', TO_DATE('1962-09-15','YYYY-MM-DD'), '975 Fire Oak, Humble, TX', 'M', '38000', '333445555','5');        
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('Joyce', 'A', 'English', '453453453', TO_DATE('1972-07-31','YYYY-MM-DD'), '5631 Rice, Houston, TX', 'F', '25000', '333445555','5');
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('Ahmad', 'V', 'Jabbar', '987987987', TO_DATE('1969-03-29','YYYY-MM-DD'), '980 Dallas, Houston, TX', 'M', '25000', '987654321','4');
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('James', 'E', 'Borg', '888665555', TO_DATE('1937-11-10','YYYY-MM-DD'), '450 Stone, Houston, TX', 'M', '55000', 'NULL' ,'1');
INSERT INTO EMPLOYEE (Fname, minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)  VALUES ('Lee', 'E', 'Berg', '228665555', TO_DATE('1988-10-06','YYYY-MM-DD'), '190 Stone, Stafford, TX', 'M', '50000', '222334444' ,'4');

INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES ('Research', '5', '333445555', TO_DATE('1988-05-22','YYYY-MM-DD'));
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES ('Administration', '4', '987654321', TO_DATE('1995-01-01','YYYY-MM-DD'));
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date) VALUES ('Headquaters', '1', '888665555', TO_DATE('1981-06-19','YYYY-MM-DD'));

INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation) VALUES ('1', 'Houston');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation) VALUES ('5', 'Bellaire');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation) VALUES ('5', 'Houston');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation) VALUES ('4', 'Stafford');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation) VALUES ('5', 'Sugarland');

INSERT INTO PROJECT (Pname , Pnumber, Plocation, Dnum) VALUES ('ProductX','1', 'Bellaire', '5');
INSERT INTO PROJECT (Pname , Pnumber, Plocation, Dnum) VALUES ('ProductY','2', 'Sugarland', '5');
INSERT INTO PROJECT (Pname , Pnumber, Plocation, Dnum) VALUES ('ProductZ','3', 'Houston', '5');
INSERT INTO PROJECT (Pname , Pnumber, Plocation, Dnum) VALUES ('Computerization','10', 'Stafford', '4');
INSERT INTO PROJECT (Pname , Pnumber, Plocation, Dnum) VALUES ('Reorganization','20', 'Houston', '1');
INSERT INTO PROJECT (Pname , Pnumber, Plocation, Dnum) VALUES ('Newbenefits','30', 'Stafford', '4');

INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES ('333445555', 'Alice', 'F' , TO_DATE('1988-10-06','YYYY-MM-DD'), 'Daughter');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES ('333445555', 'Theodore', 'M' , TO_DATE('1983-10-25','YYYY-MM-DD'), 'Son');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES ('333445555', 'Joy', 'F' , TO_DATE('1958-05-03','YYYY-MM-DD'), 'Spouse');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES ('987654321', 'Abner', 'M' , TO_DATE('1942-02-28','YYYY-MM-DD'), 'Spouse');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES ('123456789', 'Michael', 'M' , TO_DATE('1988-01-04','YYYY-MM-DD'), 'Son');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES ('123456789', 'Alice', 'F' , TO_DATE('1988-12-30','YYYY-MM-DD'), 'Daughter');

INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES ('123456789', 'Elizabeth', 'F' , TO_DATE('1967-05-05','YYYY-MM-DD'), 'Spouse');

INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('123456789','1', '32.5');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('123456789','2', '7.5');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('666884444','3', '40.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('453453453','1', '20.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('453453453','2', '20.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555','2', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555','3', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555', '10', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555','20', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('333445555','10', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('987987987','10', '35.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('987654321','20', '15.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours) VALUES ('888665555','20', NULL);



SELECT Dname, COUNT(*) FROM DEPARTMENT , EMPLOYEE  WHERE Dnumber = Dno AND Sex = 'M'  GROUP BY Dname HAVING   AVG(Salary)>30000;
SELECT DName, COUNT(*) FROM DEPARTMENT, EMPLOYEE WHERE Dnumber = Dno AND Sex ='M' AND Dname IN(SELECT Dname FROM EMPLOYEE, DEPARTMENT WHERE Dno = Dnumber GROUP BY Dname HAVING AVG(SALARY)>30000) GROUP BY Dname;
SELECT Fname, Lname FROM EMPLOYEE WHERE Dno = ( SELECT Dno FROM EMPLOYEE WHERE Salary =( SELECT MAX(Salary) FROM EMPLOYEE));
SELECT Fname, Lname FROM EMPLOYEE WHERE Salary > 10000 + (SELECT MIN(SALARY) FROM EMPLOYEE);
SELECT Fname, Lname FROM EMPLOYEE WHERE Salary = (SELECT MIN(Salary) FROM EMPLOYEE) AND Ssn IN (SELECT Ssn FROM EMPLOYEE, DEPENDENT WHERE Ssn = Essn GROUP BY Ssn HAVING COUNT(*) > 1 );
SELECT Fname, Lname, Dno, MAX(Salary) FROM EMPLOYEE GROUP BY Dno, Fname, Lname;
SELECT Fname, Lname FROM EMPLOYEE WHERE Salary = ( SELECT MAX(Salary) FROM EMPLOYEE);

CREATE VIEW MANAGER_INFO AS SELECT Dname, Fname, Salary FROM EMPLOYEE , DEPARTMENT WHERE Mgr_ssn = Ssn;
CREATE VIEW DEPT_PROJECT_INFO AS SELECT d.Dname, e.Fname, COUNT(*) FROM DEPARTMENT d, EMPLOYEE e WHERE Dno = Dnumber AND e.Super_ssn = d.Ssn AND d.Dnumber IN (SELECT COUNT (*) FROM PROJECT WHERE p.Dnum = d.Dnumber );
CREATE VIEW DEPT_HOURS_INFO AS SELECT Pname, Dname, (SELECT COUNT(*) FROM WORKS_ON w1 WHERE w1.Pno = p1.Pnumber) AS Num_Employees , (SELECT SUM(w2.Hours) FROM WORKS_ON w2 WHERE w2.Pno = p1.Pnumber  GROUP BY Pno) AS Total_Hours  FROM PROJECT p1, DEPARTMENT d1 WHERE p1.Dnum = d1.Dnumber  ;
CREATE VIEW PROJECT_INFO AS SELECT Pname, Dname, (SELECT COUNT(*) FROM WORKS_ON w1 WHERE w1.Pno = p1.Pnumber) AS num_employees, (SELECT SUM(w2.Hours) FROM WORKS_ON w2 WHERE w2.Pno = p1.Pnumber GROUP BY Pno) AS Total_hours FROM PROJECT p1, DEPARTMENT d1 WHERE p1.Dnum = d1.Dnumber AND (SELECT COUNT(*) FROM WORKS_ON w2 WHERE w2.Pno = p1.Pnumber GROUP BY w2.Pno) > 1;
CREATE VIEW EMP_INFO AS SELECT Fname, Lname, Salary, Dname, (SELECT Fname, Lname FROM EMPLOYEE e WHERE d1.Mgr_ssn = e2.Ssn) AS Mgr_name, (SELECT Salary FROM EMPLOYEE e3 WHERE d1.Mgr_ssn = e3.Ssn) AS Mgr_Salary, (SELECT AVG(Salary) FROM EMPLOYEE e4 WHERE e4.Dno = D1.Dnumber GROUP BY e4.Dno) AS Avg_Salary FROM EMPLOYEE e1, DEPARTMENT d1 WHERE (e1.Dno = d1.Dnumber);
CREATE VIEW DEPT_PROJECT_INFO AS SELECT Dname, Fname, (SELECT COUNT(*) FROM EMPLOYEE ee WHERE ee.Dno = d1.Dnumber), (SELECT COUNT (*) FROM PROJECT p WHERE p.Dnum = d1.Dnumber ) FROM DEPARTMENT d1, EMPLOYEE e1 WHERE d1.Mgr_ssn = e1.Ssn;

CREATE VIEW EMP_INFO AS SELECT Fname, Lname, Salary, Dname FROM EMPLOYEE e1, DEPARTMENT d1 WHERE e1.Dno = d1.Dnumber;

CREATE VIEW DEPT_PROJECT_INFO AS SELECT Dname, Fname, (SELECT COUNT(*) FROM EMPLOYEE ee WHERE ee.Dno = d1.Dnumber) AS number_of_emp,  (SELECT COUNT (*) FROM PROJECT p WHERE p.Dnum = d1.Dnumber ) AS number_of_projects  FROM DEPARTMENT d1, EMPLOYEE e1 WHERE d1.Mgr_ssn = e1.Ssn;
