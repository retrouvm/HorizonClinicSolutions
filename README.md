# Horizon Clinic Solutions

Horizon Clinic Solutions is a project that aims to create a hospital management database system in which Doctors and Nurses are able to detail events within appointments with their Patients. My hope is to eventually integrate this database system within a UI design that allows users, such as Doctors, Nurses, and Patients, to be verified and given access to their specific profile. I intend to set up a login page that takes credentials, and goes through a server to cross reference with the existing database. If the credentials match an existing user, they will be taken to their profile, if they don't exist, they will be prompted to enter their information and credentials to be stored into the database for future reference.

The reason Hospital Clinic Solutions has decided to focus on this management system is mainly to simplify the complex system of interactions and communication between healthcare professionals and their Patients. It will provide Patients easy access to their own health data such as diagnosis, treatments, and doctor information. We believe this kind of information is critical in today’s society and should be ready and within reach of all Patients. This could make future experiences less complicated such as, applying for insurance, and even possibly harmful or life threatening events in locations where the Patient’s medical records aren’t transferrable or easily accessible.

As the main focus of this database is to store information regarding hospital staff and Patient records, I will not be able to use real Doctor-Patient data as it would violate HIPAA rules. Under HIPAA, which stands for "Health Insurance Portability and Accountability Act of 1996," sensitive Patient health information is protected from being disclosed without the Patient's knowledge or consent. This limitation requires me to generate my own data  for the system. As a solution, I have decided to employ the Python package ‘Faker’ which we can use to generate fake data to export into a CSV file. I can then take that CSV file and import it into the different Entity tables through MYSQL workbench, which will generate the necessary SQL script to apply to the database.

## Business Rules


Patients can be under the care of only one Doctor

Doctors can have one or more Patients

When Doctor writes into Medical Record, both assigned Nurse and Patient receive access to medical record

Nurses can set up future appointments on orders of the Doctor

Patient can reschedule or request appointment

Rooms can hold multiple Patients

Each Room is assigned one Nurse

Patients have read-only access to Medical Records

Doctors can assign Prescription

Payments are made to Bills
