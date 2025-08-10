**Entities \& Attributes:**

**Employee**

Attributes: SSN (Primary Key), Fname, Lname, BirthDate, Gender

Each employee:

Must be assigned to one department

May supervise other employees (recursive relationship)

May have dependents (if still employed)





**Department**

Attributes: DName, DNUM (Primary Key), Locations (multivalued)

Each department:

Must be managed by one employee (with HireDate as attribute of relationship)

May include multiple employees

Can have multiple projects



**Project**

Attributes: PName, PNumber (Primary Key), Location, City

Each project:

Must be assigned to one department

Has many employees working on it (many-to-many with Employee), each with WorkingHours



**Dependent**

Attributes: DependentName (Primary Key under Employee), Gender, BirthDate

Only exists for currently employed employees

Related only to one employee
