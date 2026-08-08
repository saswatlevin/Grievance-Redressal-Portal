===========================PROBLEM STATEMENT===========================

A user can be one of the following: owner, operations manager, shift supervisor, cashier or customer service representative.

He / She can belong to a single outlet or no outlet.



A given outlet must belong to only a single chain.

A chain can have 1 or more outlets.



All user types except customer service representatives can create grievance posts.

Such a user may have 0 or more grievance posts.



A given grievance post can only be marked "RESOLVED" by a customer service representative.

A given grievance post may have 0 or more comments. These comments must be from users that belong to the same outlet.



A given comment can have 0 or N replies and each reply may also have 0 or N replies.

In other words, a reply is a child comment that belongs to a parent comment and each child comment can have only one parent comment.



A given grievance post can only belong to 1 outlet.

A given grievance post can contain between 0 and 4 images.

===========================PROBLEM STATEMENT===========================



Based on the above problem statement, The following Entities and Relationships between them have been deduced.



USER (user\_id, user\_date\_created\_at, user\_name, user\_password, user\_email, user\_dob, user\_role, user\_address)



CHAIN (chain\_id, chain\_date\_created\_at, chain\_name, chain\_headquarters\_address)



OUTLET (outlet\_id, outlet\_date\_created\_at, outlet\_name, outlet\_address)



POST (post\_id, post\_date\_created\_at, post\_content)



IMAGE (image\_id, image\_date\_created\_at, image\_path, image\_tag)



COMMENT (comment\_id, comment\_date\_created\_at, comment\_content)







OUTLET - USER (0:1 - 1:N) A given outlet may have 1 or N users. A given user can belong to only 1 outlet or no outlet.



CHAIN - OUTLET (0:1 - 1:N) A given chain can have 1 or N outlets. Each outlet can belong to 1 chain or no chain.



USER - POST  (1:1 - 0:N) A given user can have 0 or N posts. Each post belongs to only 1 user.



COMMENT - COMMENT (1:1 - 0:N) Each parent comment can have 0 or N child comments (replies). Each child comment belongs to only 1 parent. This is a 1:0 or N unary relationship.

NOTE: The reply\_id is a FK that denotes the presence of the child comment in this 1:M Unary relationship doesn't need to be introduced at the conceptual stage.



USER - COMMENT (1:1 - 0:N) A given user can have 0 or N comments. Each comment belongs to only 1 user.



POST - COMMENT  (1:1 - 0:N) A post can have 0 or N comments. Each comment belongs to only 1 post.



POST - IMAGE    (1:1 - 0:4) A post can have 0 or up to 4 images. Each image belongs to only 1 post.



All Entities are strong since they have their own key.



USER DATA

(100, "22-07-2026T11:00:00", "Name User", "dfkejfoe", "name@email.com", "10-07-2003", "owner", "123, Main Street, Springfield, IL 62701, USA")

(101, "22-07-2026T11:00:00", "Alice Smith", "pass1234", "alice.smith@email.com", "15-03-1990", "manager", "456, Oak Avenue, Chicago, IL 60601, USA")

(102, "22-07-2026T11:15:00", "Bob Jones", "qwerty99", "bob.jones@email.com", "28-11-1985", "employee", "789, Elm Street, Houston, TX 77001, USA")

(103, "22-07-2026T11:30:00", "Carol White", "secureX7", "carol.white@email.com", "05-06-1998", "owner", "321, Pine Road, Los Angeles, CA 90001, USA")

(104, "22-07-2026T11:45:00", "David Brown", "mypass55", "david.brown@email.com", "19-09-1992", "employee", "654, Maple Lane, New York, NY 10001, USA")

(105, "22-07-2026T12:00:00", "Eva Garcia", "evapass8", "eva.garcia@email.com", "22-01-2000", "manager", "987, Cedar Boulevard, Phoenix, AZ 85001, USA")



CHAIN DATA

(1, "22-07-2026T09:00:00", "Burger Barn", "100, West Madison Street, Chicago, IL 60602, USA")

(2, "22-07-2026T09:15:00", "Pizza Palace", "250, Fifth Avenue, New York, NY 10001, USA")

(3, "22-07-2026T09:15:00", "Taco Town", "500, South Grand Avenue, Los Angeles, CA 90071, USA")

(4, "22-07-2026T09:45:00", "Sushi Square", "75, Robson Street, Vancouver, BC V6B 1A1, Canada")

(5, "22-07-2026T10:00:00", "Pasta Point", "30, Flinders Street, Melbourne, VIC 3000, Australia")



OUTLET DATA

(1, "22-07-2026T09:30:00", "Burger Barn - Chicago Downtown", "100, West Madison Street, Chicago, IL 60602, USA")

(2, "22-07-2026T09:45:00", "Burger Barn - Chicago Northside", "456, North Clark Street, Chicago, IL 60614, USA")

(3, "22-07-2026T09:45:00", "Pizza Palace - Manhattan", "250, Fifth Avenue, New York, NY 10001, USA")

(4, "22-07-2026T10:15:00", "Pizza Palace - Brooklyn", "789, Atlantic Avenue, Brooklyn, NY 11217, USA")

(5, "22-07-2026T10:30:00", "Taco Town - LA Downtown", "500, South Grand Avenue, Los Angeles, CA 90071, USA")



POST DATA

(1, "22-07-2026T11:00:00", "The waiting time at the counter is too long. Customers are leaving without ordering.")

(2, "22-07-2026T11:15:00", "The air conditioning in the dining area has not been working for 3 days now.")

(3, "22-07-2026T11:15:00", "We are consistently running out of stock of the Margherita Pizza by 7PM.")

(4, "22-07-2026T11:45:00", "The POS system keeps crashing during peak hours causing delays.")

(5, "22-07-2026T12:00:00", "There is a water leakage issue in the kitchen near the prep station.")



IMAGE DATA

(1, "22-07-2026T11:00:00", "/images/posts/1/counter\_queue.jpg", "long queue at counter")

(2, "22-07-2026T11:00:00", "/images/posts/1/counter\_queue2.jpg", "queue from another angle")

(3, "22-07-2026T11:15:00", "/images/posts/2/ac\_unit.jpg", "broken AC unit")

(4, "22-07-2026T11:30:00", "/images/posts/3/empty\_shelf.jpg", "empty Margherita stock shelf")

(6, "22-07-2026T11:45:00", "/images/posts/4/pos\_error.jpg", "POS system error screen")



COMMENT DATA

(1, "22-07-2026T11:05:00", "This has been an ongoing issue for 2 weeks now.")

(2, "22-07-2026T11:05:00", "I agree, we need at least one more staff member at the counter during peak hours.")

(3, "22-07-2026T11:20:00", "The technician was supposed to fix this yesterday but never showed up.")

(4, "22-07-2026T11:35:00", "We should increase the Margherita stock order by at least 20 units.")

(5, "22-07-2026T11:50:00", "IT support has been notified about the POS issue but no response yet.")



NOTE: Address will be decomposed into room\_no, building, street, city, admin\_division, country

NOTE: Any 2 tuples can have the same date\_created\_at.



NORMALISATION FOR USER ENTITY

UNF to 1NF

user\_address, a composite attribute is split into user\_address\_room\_no, user\_address\_building, user\_address\_street, user\_address\_city, user\_address\_admin\_division, user\_address\_country



user\_name, another composite attribute is split into user\_first\_name, user\_last\_name.



USER (**user\_id**, user\_date\_created\_at, user\_first\_name, user\_last\_name, user\_password, user\_email, user\_dob, user\_role, user\_address\_room\_no, user\_address\_building, user\_address\_street, user\_address\_city, user\_address\_admin\_division, user\_address\_country)



CK(s): user\_id, user\_email (Since it is unique for every tuple)

PK: user\_id (Since it is unique for every tuple)



1NF to 2NF

There are **no partial dependencies**, since USER has no composite PK. So, USER is already in 2NF.

USER (**user\_id**, user\_date\_created\_at, user\_first\_name, user\_last\_name, user\_password, user\_email, user\_dob, user\_role, user\_address\_room\_no, user\_address\_building, user\_address\_street, user\_address\_city, user\_address\_admin\_division, user\_address\_country)



2NF to 3NF

There are no **transitive dependencies**. Since, there are non non-key attributes on which other attributes are functionally dependent. So, USER is already in 3NF.

USER (**user\_id**, user\_date\_created\_at, user\_first\_name, user\_last\_name, user\_password, user\_email, user\_dob, user\_role, user\_address\_room\_no, user\_address\_building, user\_address\_street, user\_address\_city, user\_address\_admin\_division, user\_address\_country)

==========================================================================================================================================================



NORMALISATION FOR CHAIN ENTITY

UNF to 1NF

chain\_headquarters\_address, a composite attribute is split into chain\_headquarters\_address\_room\_no, chain\_headquarters\_address\_building, chain\_headquarters\_address\_street, chain\_headquarters\_address\_city, chain\_headquarters\_address\_admin\_division, chain\_headquarters\_address\_country



CHAIN (**chain\_id**, chain\_date\_created\_at, chain\_name, chain\_headquarters\_address\_room\_no, chain\_headquarters\_address\_building, chain\_headquarters\_address\_street, chain\_headquarters\_address\_city, chain\_headquarters\_address\_admin\_division, chain\_headquarters\_address\_country)



CK(s): chain\_id (Since it is unique for every tuple)

PK: chain\_id (Since it is unique for every tuple)



NOTE: chain\_name is not unique.

NOTE: chain\_headquarters\_\* attributes are not unique. An example if many chains HQs are located in the same mall.



1NF to 2NF

There are **no partial dependencies**, since CHAIN has no composite PK. So, CHAIN is already in 2NF.

CHAIN (**chain\_id**, chain\_date\_created\_at, chain\_name, chain\_headquarters\_address\_room\_no, chain\_headquarters\_address\_building, chain\_headquarters\_address\_street, chain\_headquarters\_address\_city, chain\_headquarters\_address\_admin\_division, chain\_headquarters\_address\_country)





2NF to 3NF

There are no **transitive dependencies.** So, CHAIN is already in 3NF.

CHAIN (**chain\_id**, chain\_date\_created\_at, chain\_name, chain\_headquarters\_address\_room\_no, chain\_headquarters\_address\_building, chain\_headquarters\_address\_street, chain\_headquarters\_address\_city, chain\_headquarters\_address\_admin\_division, chain\_headquarters\_address\_country)

==========================================================================================================================================================



NORMALISATION FOR OUTLET ENTITY

UNF to 1NF

outlet\_address, a composite attribute is split into outlet\_address\_room\_no, outlet\_address\_building, outlet\_address\_street, outlet\_address\_city, outlet\_address\_admin\_division, outlet\_address\_country



OUTLET (**outlet\_id**, outlet\_date\_created\_at, outlet\_name, outlet\_address\_room\_no, outlet\_address\_building, outlet\_address\_street, outlet\_address\_city, outlet\_address\_admin\_division, outlet\_address\_country)



NOTE: outlet\_name will be unique.

NOTE: outlet\_address\_\* attributes will not be unique. Eg - If 2 outlets of the same chain are located in the same mall.



CK(s): outlet\_id, outlet\_name (Since they are unique for each tuple).

PK: outlet\_id



1NF to 2NF:

There are no **partial dependencies**. This is because OUTLET does not have a composite Primary Key. So, OUTLET is already in 2NF.

OUTLET (**outlet\_id**, outlet\_date\_created\_at, outlet\_name, outlet\_address\_room\_no, outlet\_address\_building, outlet\_address\_street, outlet\_address\_city, outlet\_address\_admin\_division, outlet\_address\_country)



2NF to 3NF:

There are no **transitive dependencies**. Thus, OUTLET is already in 3NF.

OUTLET (**outlet\_id**, outlet\_date\_created\_at, outlet\_name, outlet\_address\_room\_no, outlet\_address\_building, outlet\_address\_street, outlet\_address\_city, outlet\_address\_admin\_division, outlet\_address\_country)

==========================================================================================================================================================



NORMALISATION FOR POST ENTITY

UNF to 1NF

POST (**post\_id**, post\_date\_created\_at, post\_content)



NOTE: post\_content is not unique.



CK: post\_id (Since it is unique for each tuple)

PK: post\_id



1NF to 2NF

There are no **partial dependencies**. This is because POST does not have a composite Primary Key. So, POST is already in 2NF.

POST (**post\_id**, post\_date\_created\_at, post\_content)



2NF to 3NF

There are no **transitive dependencies**. So, POST is already in 3NF.

POST (**post\_id**, post\_date\_created\_at, post\_content)

==========================================================================================================================================================



NORMALISATION FOR IMAGE ENTITY

UNF to 1NF

IMAGE (**image\_id**, image\_date\_created\_at, image\_path, image\_tag)



NOTE: image\_date\_created\_at is not unique.

NOTE: image\_path is not unique.

NOTE: image\_tag is not unique.



CK: image\_id (Since it is unique for each tuple)

PK: image\_id



1NF to 2NF

There are no **partial dependencies**. This is because IMAGE doesn't have a composite Primary Key. So, IMAGE is already in 2NF.

IMAGE (**image\_id**, image\_date\_created\_at, image\_path, image\_tag)



2NF to 3NF

There are no **transitive dependencies**. So, IMAGE is already in 3NF

IMAGE (**image\_id**, image\_date\_created\_at, image\_path, image\_tag)

==========================================================================================================================================================



NORMALISATION FOR COMMENT ENTITY

UNF to 1NF

COMMENT (**comment\_id**, comment\_date\_created\_at, comment\_content)



NOTE: comment\_date\_created\_at is not unique.

NOTE: comment\_content is not unique.



CK: comment\_id

PK: comment\_id



1NF to 2NF

There are no **partial dependencies**. This is because COMMENT doesn't have a composite Primary Key. So, COMMENT is already in 2NF.

COMMENT (**comment\_id**, comment\_date\_created\_at, comment\_content)



2NF to 3NF

There are no **transitive dependencies**. So, COMMENT is already in 3NF.

COMMENT (**comment\_id**, comment\_date\_created\_at, comment\_content)

==========================================================================================================================================================



LOGICAL MODELLING OF THE OUTLET - USER RELATIONSHIP

OUTLET - USER (1:1 - 1:N) A given outlet may have 1 or N users. A given user can belong to only 1 outlet.

Thus the PK of the OUTLET entity (outlet\_id) is placed as an FK in the USER entity.



OUTLET and USER have mandatory participation in their relationship. Thus, when an OUTLET ceases to exist, then the outlet\_id FK should be ON DELETE SET NULL. This is because a USER can logically exist without an OUTLET. The outlet\_id FK in USER can be NULL since a USER can exist without an OUTLET.



LOGICAL MODELLING OF THE CHAIN - OUTLET RELATIONSHIP

CHAIN - OUTLET (1:1 - 1:N) A given chain can have 1 or N outlets. Each outlet can belong to only 1 chain.

Thus the PK of the CHAIN entity (chain\_id) is placed as an FK in the OUTLET entity.



CHAIN and OUTLET have mandatory participation with each other. An OUTLET cannot also exist without a CHAIN. Thus, when a CHAIN is deleted, then all OUTLETS with that chain\_id FK should be ON DELETE CASCADE. The chain\_id FK in OUTLET can't be NULL since an OUTLET can't exist without a CHAIN.



LOGICAL MODELLING OF THE USER - POST RELATIONSHIP

USER - POST  (1:1 - 0:N) A given user can have 0 or N posts. Each post belongs to only 1 user.

Thus the PK of the USER entity (user\_id) is placed as an FK in the POST entity.



USER doesn't have mandatory participation in the relationship, but POST does. Since, logically a POST cannot exist without a USER, so when a USER is deleted, we do ON DELETE CASCADE. Note that the user\_id FK in POST cannot be NULL since a POST cannot exist without a USER.



LOGICAL MODELLING OF THE COMMENT - COMMENT RELATIONSHIP

COMMENT - COMMENT (1:1 - 0:N)  Each parent comment can have 0 or N child comments (replies). Each child comment belongs to only 1 parent. This is a 1:0 or N unary relationship.

Thus, the PK of the COMMENT (comment\_id) becomes the FK of the child comments (reply\_id) in COMMENT itself.



COMMENT doesn't have mandatory participation in the relationship. When a COMMENT is deleted, then all its reply\_ids will also be deleted since a reply can't exist without a COMMENT, so ON DELETE CASCADE for reply\_id FK. Note that the reply\_id FK in COMMENT can be NULL given that a COMMENT when initially created will not have any replies.



LOGICAL MODELLING OF THE USER - COMMENT RELATIONSHIP

USER - COMMENT (1:1 - 0:N) A given user can have 0 or N comments. Each comment belongs to only 1 user.

Thus, the PK of the USER entity (user\_id) will be put as FK in the COMMENT entity.

USER has optional participation in this relationship while COMMENT has mandatory participation, so, when a USER is deleted, then ON DELETE CASCADE for user\_id FK in COMMENT. The user\_id FK in COMMENT can't be NULL since a COMMENT can't exist without a USER.



LOGICAL MODELLING OF THE POST - COMMENT RELATIONSHIP

POST - COMMENT  (1:1 - 0:N) A post can have 0 or N comments. Each comment belongs to only 1 post.

Thus, the PK of the POST entity (post\_id) will be put as FK in the COMMENT entity.



POST doesn't have mandatory participation in this relationship, but COMMENT does. So, when a POST is deleted, then all the comment\_id FKs in POST must ON DELETE CASCADE. A post\_id FK in COMMENT can't be NULL since a COMMENT can't exist without a POST.



LOGICAL MODELLING OF THE POST - IMAGE RELATIONSHIP

POST - IMAGE (1:1 - 0:4) A post can have 0 or up to 4 images. Each image belongs to only 1 post.

Thus, the PK of the POST entity (post\_id) will be put as FK in the IMAGE entity.



POST doesn't have mandatory participation in this relationship, but IMAGE does. So, when a POST is deleted, then all the post\_id FKs in IMAGE must ON DELETE CASCADE. A post\_id FK in IMAGE can't be NULL since an IMAGE can't exist without a POST.





Final Logical Model Entities:



USER (user\_id, user\_date\_created\_at, user\_first\_name, user\_last\_name, user\_password, user\_email, user\_dob, user\_role, user\_address\_room\_no, user\_address\_building, user\_address\_street, user\_address\_city, user\_address\_admin\_division, user\_address\_country, outlet\_id FK nullable, user\_mobile\_no)



CHAIN (chain\_id, chain\_date\_created\_at, chain\_name, chain\_headquarters\_address\_room\_no, chain\_headquarters\_address\_building, chain\_headquarters\_address\_street, chain\_headquarters\_address\_city, chain\_headquarters\_address\_admin\_division, chain\_headquarters\_address\_country, chain\_headquarters\_address\_postcode)



OUTLET (outlet\_id, outlet\_date\_created\_at, outlet\_name, outlet\_address\_room\_no, outlet\_address\_building, outlet\_address\_street, outlet\_address\_city, outlet\_address\_admin\_division, outlet\_address\_country, outlet\_address\_postcode, chain\_id FK NOT NULL)



POST (post\_id, post\_date\_created\_at, post\_content, user\_id FK NOT NULL)



IMAGE (image\_id, image\_date\_created\_at, image\_path, image\_tag, post\_id FK NOT NULL)



COMMENT (comment\_id, comment\_date\_created\_at, comment\_content, comment\_is\_deleted, post\_id FK NOT NULL, user\_id FK NOT NULL, reply\_id FK nullable)

