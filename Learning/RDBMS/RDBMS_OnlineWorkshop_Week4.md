MY SOLUTIONS:

Q1 of WEEK4 OnlineWorkshop



ORDER (orderno, orderdate, custnumb, custname, custaddress, (prodno, proddesc, qtyordered, lineprice))



Does orderno depend on orderdate? -> YES, since a particular order can have only a particular date.

orderno -> orderdate



Does custname depend on custnumb? -> YES, since a particular custname can have only a particular custnumb.

custnumb -> custname



Does custaddress depend on custnumb? -> YES, since a particular custaddress can have only a particulat custnumb

custnumb -> custaddress



Do proddesc, qtyordered and lineprice depend on prodno? -> YES, this is because a particular proddesc, a particular qtyordered and a particular lineprice can only have a particular prodno



prodno -> proddesc

prodno -> qtyordered

prodno -> lineprice



So, the 1NF of the CUSTOMER ORDER is:

ORDER (**custnumb**, **orderno**, orderdate)

CUSTOMER (**custnumb**, custname, custaddress)

ORDER\_PROD (**orderno**, **prodno**, proddesc, qtyordered, lineprice)

============================================================================================================================================================

My Assumptions:

&#x20; \* 1 CUSTOMER can have N ORDER.

&#x20; \* 1 ORDER can have N PRODUCT in it and 1 PRDOUCT can be in N ORDER. Thus, we created an entity called ORDER\_PROD which will have the Primary Keys (orderno, prodno) of ORDER and PRODUCT respectively and ORDER will have a 1:N relation with ORD\_PROD and PRODUCT will have a 1:N relation with ORD\_PROD too.



Q2 of WEEK4 OnlineWorkshop



ASSIGNMENT (proj\_num, emp\_num, proj\_name, emp\_name, job\_class, chg\_hour, assign\_hours)



ASSUMPTIONS

&#x20; \* I think that there will be 2 Entities: PROJECT and ASSIGNMENT.

&#x20; \* proj\_num is the PRIMARY KEY of the PROJECT Entity.

&#x20; \* (emp\_num, proj\_num) is the PRIMARY KEY of the ASSIGNMENT Entity.

&#x20; \* 1 PROJECT can have 1 ASSIGNMENT.





ASSIGNMENT (**proj\_num**, **emp\_num**, emp\_name, proj\_name, job\_class, chg\_hour, assign\_hours)



Does proj\_name depend on proj\_num -> YES, for a particular proj\_name, there can only be a particular proj\_num.

proj\_num -> proj\_name



Does emp\_name depend on emp\_num -> YES, for a particular emp\_name there can only be a particular emp\_num.

emp\_num -> emp\_name



Does job\_class depend on proj\_num and emp\_num? YES, This is because a given employee can have different job\_class for different projects.

(emp\_num, proj\_name) -> job\_class



Does chg\_hour depend on proj\_num and emp\_num? YES, This is because a given employee can have different chg\_hour for different projects.

(emp\_num, proj\_name) -> chg\_hour



Does assign\_hours depend on proj\_num and emp\_num? YES, This is because a given employee can have different assign\_hours for different projects.

(emp\_num, proj\_name) -> assign\_hours

============================================================================================================================================================

Q3 of WEEK4 OnlineWorkShop

============================================================================================================================================================

Q4 of WEEK4 OnlineWorkshop

============================================================================================================================================================





LINDSAY SMITH's SOLUTIONS

Characterization of the Data

1. emp\_name, job\_class and chg\_hour all depend on emp\_num
2. An employee may be a part of more than 1 project.
3. The assign\_hour of an employee varies across projects.
4. The assign\_hour depends on proj\_num.



To begin the process of Normalisation, we need to convert the data in the table into a form.



1. We need to see what the data is about, i.e., the subject and name the form accordingly.
2. We need to group all the attributes that appear multiple times, together.



So, we name the form ASSIGNMENT and group all its attributes together as follows: ASSIGNMENT (proj\_num, emp\_num, emp\_name, job\_class, chg\_hour, assign\_hours).



CONVERTING A FORM TO A RELATION

When converting a form to a relation, we group all the attributes that have only a single value into a group. If the form has some attributes that have multiple rows of data, then we group those attributes together in a different group.



CUSTOMER\_ORDER (order\_no, order\_date, cust\_no, cust\_name, cust\_address, (prod\_no, prod\_desc, co\_qty\_ordered, co\_line\_price))



ANSWER to Q1 of WEEK4 OnlineWorkshop:

&#x20; \* The Answer is A: - ORDER (**orderno**, orderdate, custnumb, custname, custaddress)

\- ORDER\_PROD (**orderno**, **prodno**, proddesc, qtyordered, lineprice). This is because only 2 relations can be formed from such a FORM. The first relation (ORDER) is all the attributes that have only a single value. This relation has a PRIMARY\_KEY of **orderno**.



The second relation is ORDER\_PROD. It has a PK of (orderno, prodno), i.e., the PK of the Parent relation is added to its PK.





ANSWER to Q2 of WEEK4 OnlineWorkshop:

&#x20; \* The Answer is B: ASSIGNMENT (**proj\_num, emp\_num**, proj\_name, emp\_name, job\_class, chg\_hour, assign\_hours). Refer to Characterization of the Data.



ANSWER to Q3 of WEEK4 OnlineWorkshop:

&#x20; \* proj\_num -> proj\_name

&#x20; \* emp\_num -> emp\_name

&#x20; \* emp\_num -> job\_class

&#x20; \* emp\_num -> chg\_hour

&#x20; \* (proj\_num, emp\_num) -> assign\_hours

&#x20; The Answer is F: More than One option. This is because more than 1 attribute is partially dependent.



ANSWER to Q4 of WEEK4 OnlineWorkshop:

&#x20; \* When looking for a Transitive Dependency, please hide the PRIMARY\_KEY. In the context of X -> Y-> Z, X, Y and Z are non-key attributes.

&#x20; \* We found that job\_class -> chg\_hour. This is because the job\_class is given the same chg\_hour across all projects. Since, emp\_num -> job\_class and job\_class -> chg\_hour, so emp\_num -> job\_class -> chg\_hour is a Transitive Dependency.



When we go from 1NF to 2NF in case of the ASSIGNMENT table, then we split ASSIGNMENT into 3 RELATIONS

&#x20;ASSIGNMENT (**proj\_num**, **emp\_num**, assign\_hours) -> This is because assign\_hours depends on (**proj\_num**, **emp\_num**).

&#x20;PROJECT (**proj\_num**, proj\_name) -> This is because proj\_name depends on proj\_num.

&#x20;EMPLOYEE (**emp\_num**, emp\_name, job\_class, chg\_hour) -> This is because **emp\_name, job\_class** and **chg\_hour** are all dependent on **emp\_num**.



ANSWER to Q5 of WEEK4 OnlineWorkshop:

&#x20; \* The Answer is B: ASSIGNMENT. The reason is that **emp\_num** which is the PK of EMPLOYEE and **proj\_num** which is the PK of PROJECT end up in ASSIGNMENT as (**emp\_num**, **proj\_num**). While this is the PK of assignment, **emp\_num** and **proj\_num** individually are the FKs of EMPLOYEE and PROJECT respectively.



ANSWER to Q6 of WEEK4 OnlineWorkshop:

&#x20; \* The Answer is B: identifying, identifying.

&#x20; \* The reason is that ASSIGNMENT is a Composite (or Associative, IDK) Entity that is formed from EMPLOYEE and PROJECT. Since its FK contains the PKs of both EMPLOYEE and PROJECT, so both EMPLOYEE and PROJECT have "identifying" relationships with it.



There is a transitive dependency of **emp\_num** -> job\_class -> chg\_hour. We need to remove it to covert EMPLOYEE to 3NF. We do so, by shifting job\_class and chg\_hour to a new Entity called JOB. In JOB, the PK will be **job\_class**. Also, while chg\_hour **will be removed** from EMPLOYEE, **job\_class** **will remain** in EMPLOYEE.



ASSIGNMENT (**proj\_num**, **emp\_num**, assign\_hours)

PROJECT (**proj\_num**, proj\_name)

EMPLOYEE (**emp\_num**, emp\_name, job\_class)

JOB (**job\_class**, chg\_hour)



ANSWER to Q7 of WEEK4 OnlineWorkshop:

&#x20; \* The Answer is A: EMPLOYEE. This is because **job\_class** is the PK of the JOB relation.



ANSWER to Q8 of WEEK4 OnlineWorkshop:

&#x20; \* The Answer is B: identifying. This is because **job\_class** is the PK of the JOB entity and the FK of the EMPLOYEE entity.

&#x20;   

