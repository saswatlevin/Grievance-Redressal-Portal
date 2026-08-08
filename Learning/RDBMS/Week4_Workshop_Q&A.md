=============WEEK4 WORKSHOP=============

INSERT, UPDATE and DELETE anomalies in DRUG data:

&#x20; \* A drug can't be inserted if it isn't matched with a SLSREP (INSERT Anomaly)

&#x20; \* If we want to update a SLSREP's name, then we have to update it in multiple places. (UPDATE Anomaly)

&#x20; \* If we delete the Rigidity HP DRUG\_NAME, then we lose Sheryl Sturney's details. (DELETE Anomaly).



REPRESENTING A FORM AS A RELATION

&#x20; \* Arrive at a name for the Form.

&#x20; \* Determine if any attribute is multivalued (repeated) for a given entity instance of the forms subject.



We will give the form a name -> DRUG

DRUG(drug\_code, drug\_name, slsrep\_id, slsrep\_name, slsrep\_mobile) -> This is UNF.

We need to check for repeating groups. Repeating groups occur when there are multi-valued attributes, i.e., more than 1 value in a cell.



When a functional dependency is caused by a non-key attribute, then that is a transitive dependency.



ANSWER to Q1 of WEEK4 Q\&AWorkshop:

&#x20; \* STOCK(part\_number, part\_name, cat\_code, cat\_name, stock, sell\_price, (vendor\_no, vendor\_name, date\_purchased, cost\_per\_unit, qty\_supplied, payment)) -> UNF



ANSWER to Q2 of WEEK4 Q\&AWorkshop:

&#x20; The answer is B:

&#x20; PART (**part\_number**, part\_name, cat\_code, cat\_name, stock, sell\_price)

&#x20; RESTOCK (**vendor\_no, part\_number**, **date\_purchased**, vendor\_name, cost\_per\_unit, qty\_supplied, payment)

&#x20;

&#x20; To understand why **date\_purchased** is a part of the Primary Key, the same part can be ordered from the same vendor again. THus, we need a date to ensure that the PK stays unique.



ANSWER to Q3 of WEEK4 Q\&AWorkshop:

The Answer is D: None of These.



To move from 1NF to 2NF, we need to look for Partial Dependencies. We have found that vendor\_no -> vendor\_name is a partial dependency. So, we remove vendor\_name from RESTOCK.

PART (**part\_no**, part\_name, cat\_code, cat\_name, part\_stock, part\_sell)

RESTOCK (**part\_no**, **vendor\_no**, **restock\_date\_purchased**, restock\_costpu, restock\_qtysupplied, restock\_payment)

VENDOR (**vendor\_no**, vendor\_name)



To move from 2NF to 3NF, we need to look for Transitive Dependencies. We have found that cat\_code -> cat\_name is a Transitive Dependency. So, we remove cat\_name from PART but keep cat\_code in it. We create a new relation called CATEGORY.



PART (**part\_no**, part\_name, cat\_code, part\_stock, part\_sell)

RESTOCK (**part\_no**, **vendor\_no**, **restock\_date\_purchased**, restock\_costpu, restock\_qtysupplied, restock\_payment)

VENDOR (**vendor\_no**, vendor\_name)

CATEGORY (**cat\_code**, cat\_name)



NOTE: cat\_code isn't a FK in PART since the PK in PART isn't composite AND no attribute has a Functional Dependency with cat\_code. 

ANSWER to Q4 of WEEK4 Q\&AWorkshop:

&#x20; \* part\_no is the PK of PART; 

&#x20; \* vendor\_no is the PK of vendor;

&#x20; \* cat\_code is the PK of CATEGORY

&#x20; \* RESTOCK has 1 PK (**part\_no**, **vendor\_no**, **restock\_date\_purchased**) and 3 FKs (**vendor\_no**) and (**part\_no**) and (cat\_code).



So, the answer is C: 4 PKs and 3 FKs.

=============WEEK4 WORKSHOP=============

