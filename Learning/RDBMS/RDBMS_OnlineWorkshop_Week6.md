Answer to Q1 of Week 6 OnlineWOrkshop:

&#x20; \* The Answer is E: More than one option in a to d is correct.

&#x20;   This is because the Logical Model shown is as follows:

&#x20;     \* UNIT - ENROLMENT (1:1 - 0:N)

&#x20;     \* STUDENT - ENROLMENT (1:1 - 0:N)

&#x20;   So, the following statements are correct:

&#x20;     \* An enrolment record is created for a particular student  of a unit in a given semester and year.

&#x20;     \*  A student can have more than one grade for a given unit.



Answer to Q2 of Week 6 OnlineWorkshop:

&#x20; \* The Answer is F: Some of the options in a to d are correct.

&#x20;   This is because the CREATE TABLE statement defines the following:

&#x20;     \* Relation, Attribute, Domain

&#x20;     \* Primary Key



Answer to Q3 of Week 6 OnlineWorkshop:

&#x20; \* The Answer is E: More than one option is correct.

&#x20;   This is because ENROLMENT contains STU\_NBR and UNIT\_CODE which are the PKs of STUDENT and UNIT respectively.

&#x20;     \* Thus, either we create UNIT, STUDENT, ENROLMENT

&#x20;     \* Or, we create STUDENT, UNIT ENROLMENT



Answer to Q4 of Week 6 OnlineWorkshop:

&#x20; \* The Answer is B: 2.

&#x20;   The is because ENROLMENT has 2 FKs in it.



Answer to Q5 of Week 6 OnlineWorkshop:

&#x20; \* The Answer is A: They will be deleted.

&#x20;   This is because the CASCADE action is specified in the referential integrity enforcing table constraint on unit\_code (FK of ENROLMENT and PK of UNIT).



Answer to Q6 of Week 6 OnlineWorkshop:

&#x20; \* The Answer is B: Nothing will happen to the STUDENT table.

&#x20;   This is because deletion of any record referred to by an FK, will not affect the corresponding record referred to by the corresponding PK.



Answer to Q7 of Week 6 OnlineWorkshop:

&#x20; \* The Answer is D: ba nd c are correct.

&#x20;   This is because PROJECT MANAGER has mandatory participation in the 1:1 - 0:N relationship with PROJECT.



Answer to Q8 of Week 6 OnlineWorkshop:

&#x20; \* The Answer is C: STUDENT -> UNIT -> ENROLMENT

&#x20;   This is as ENROLMENT has FKs from both UNIT and STUDENT.



CREATE TABLE enrolment

&#x20; (

&#x20;   stu\_nbr   NUMBER(8) NOT NULL,

&#x20;   unit\_code CHAR(8) NOT NULL,

&#x20;   enrol\_year NUMBER(4) NOT NULL,

&#x20;   enrol\_semester  CHAR(2) NOT NULL,

&#x20;   mark NUMBER (3),

&#x20;   grade CHAR(2),

&#x20;

&#x20;   CONSTRAINT pk\_enrolment PRIMARY KEY  (stu\_nbr, unit\_code, enrol\_year, enrol\_semester)

&#x20; );



&#x20;



CREATE TABLE employee

&#x20; (

&#x20;   emp\_no NUMBER (5) NOT NULL,

&#x20;   emp\_fname VARCHAR(30),

&#x20;   emp\_lname VARCHAR (30),

&#x20;   emp\_street VARCHAR (50) NOT NULL,

&#x20;   emp\_town VARCHAR (30) NOT NULL,

&#x20;   emp\_pcode CHAR (4) NOT NULL,

&#x20;   emp\_dob DATE NOT NULL,

&#x20;   emp\_taxno VARCHAR (20),

&#x20;   team\_no NUMBER (3),

&#x20;   mentor NUMBER (5)

&#x20;   CONSTRAINT pk\_employee PRIMARY KEY (emp\_no)

&#x20; );



CREATE TABLE team

&#x20; (

&#x20;   team\_no NUMBER (3) NOT NULL,

&#x20;   emp\_no NUMBER (5) NOT NULL,

&#x20;   CONSTRAINT pk\_team PRIMARY KEY (team\_no)

&#x20; );





ALTER TABLE team

&#x20; (

&#x20;   CONSTRAINT fk\_employee FOREIGN KEY (emp\_no) REFERENCES employee (emp\_no) ON DELETE SET NULL

&#x20; );



ALTER TABLE employee

&#x20; (

&#x20;   CONSTRAINT fk\_team FOREIGN KEY (team\_no) REFERENCES team (team\_no) ON DELETE SET NULL,

&#x20;   CONSTRAINT fk\_has\_mentor FOREIGN KEY (mentor\_no) REFERENCES employee (emp\_no) ON DELETE SET NULL,

&#x20;   CONSTRAINT fk\_leads\_team FOREIGN KEY (emp\_no) REFERENCES employee (emp\_no) ON DELETE SET NULL      

&#x20; );





