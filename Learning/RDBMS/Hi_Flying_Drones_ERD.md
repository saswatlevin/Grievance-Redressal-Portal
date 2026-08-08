DRONE(drone\_id, drone\_type\_code, drone\_purchase\_date, drone\_type\_model, done\_carrying\_capacity, drone\_hire\_rate, drone\_total\_flight\_hours)

TRAINING\_COURSE (training\_code, training\_description, training\_duration)

CUSTOMER (customer\_id, customer\_name, customer\_contact\_number)

//CUST\_TRAIN (training\_code, cust\_train\_completion\_date, cust\_train\_expiry\_date)

DRONE\_RENTAL(drone\_rental\_number, drone\_rental\_issue\_date, drone\_rental\_bond, training\_code, drone\_retal\_return\_date)



TRAINING\_COURSE - DRONE (1:N)

CUSTOMER - TRAINING\_COURSE (M:N)

CUSTOMER - DRONE\_RENTAL (M:N)

TRAINING\_COURSE - DRONE\_RENTAL (1:N)



DRONE NORMALISATION FORM

UNF: There are 3 repeating groups: (dt\_code, dt\_model, dt\_manuf);;; (train\_date,trainer\_id, trainer\_rego, trainer\_fname, trainer\_lname, trainer\_category) AND (cust\_id, cust\_fname,cust\_lname, ct\_exam\_date, ct\_date\_expire) with the 3rd repeating group nested inside the second.



1NF:



TRAINING(**train\_code**, train\_desc, train\_active\_mnths)



DRONETYPE (**dt\_code**, dt\_model, dt\_manuf, train\_code)

NOTE: Here, train\_code is a Foreign Key of TRAINING. However, we have not included it as part of the PK since it does not determine dt\_model AND dt\_manuf.



TRAINING\_COURSE (**train\_code**, **train\_date**, trainer\_id, trainer\_rego, trainer\_fname,trainer\_lname, trainer\_category)

CK train\_date, trainer\_id (and train\_date, trainer\_rego assuming trainer\_rego is unique)

NOTE:  The trainer\_id is not part of the PK over here since there is only 1 training course for a particular training code on a given day.

&#x20;      A Trainer can only run 1 training course per day.

&#x20;      Thus, the combination of train\_code and train\_date is unique enough to be a PK.



CUST\_TRAINING (**train\_code**, **train\_date**, **cust\_id**, cust\_fname, cust\_lname, ct\_exam\_date,ct\_date\_expire)

NOTE: The PK here is (**train\_code**, **train\_date**, **cust\_id**) since a customer can take multiple courses multiple times.



Partial Dependencies:

cust\_id -> cust\_fname, cust\_lname



trainer\_id -> trainer\_rego, trainer\_fname, trainer\_lname, trainer\_category

(selected to use trainer\_id from the CK's, using trainer\_rego is an alternative and would produce:



trainer\_rego -> trainer\_id, trainer\_fname, trainer\_lname, trainer\_category

However given our characteristics for a PK, trainer\_id is a better choice)







