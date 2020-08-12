create database BusReservation

use BusReservation

create table DriverDetails(
DID int constraint pk_DID primary key identity(101,1) not null,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
PhoneNumber varchar(15) constraint uk_PhoneNo unique not null)

sp_help DriverDetails

insert into DriverDetails(FirstName, LastName, PhoneNumber) values('Manoj','Kumar','+91-9828451765')
insert into DriverDetails(FirstName, LastName, PhoneNumber) values('Deepak','Sharma','+91-9857299813')
insert into DriverDetails(FirstName, LastName, PhoneNumber) values('Andrew','Matthews','+91-7011372417')
insert into DriverDetails(FirstName, LastName, PhoneNumber) values('Sam','Polo','+91-7836144528')

Select * from DriverDetails

create table BusDetails(
BusID int constraint pk_BusID primary key identity(1,1) not null,
BusNumber nvarchar(50) constraint uk_BusNumber unique not null,
DriverID int not null,
DriverPhone varchar(15) not null,
BusType nvarchar(20) not null,
NumberOfSeats int not null,
BusAvailability bit not null,
constraint fk_DriverID FOREIGN KEY (DriverID)
        REFERENCES DriverDetails (DID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
constraint fk_DriverPhone FOREIGN KEY (DriverPhone)
        REFERENCES DriverDetails (PhoneNumber)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)

sp_help BusDetails

insert into BusDetails(BusNumber, DriverID, DriverPhone, BusType, NumberOfSeats, BusAvailability) values('HR 09 UB 8902', 102, '+91-9857299813','AC', 40, 1)
insert into BusDetails(BusNumber, DriverID, DriverPhone, BusType, NumberOfSeats, BusAvailability) values('PB 06 DB 7879', 103, '+91-7011372417','AC', 40, 0)
insert into BusDetails(BusNumber, DriverID, DriverPhone, BusType, NumberOfSeats, BusAvailability) values('DL 07 TR 2020', 101, '+91-9828451765','NON-AC', 40, 1)
insert into BusDetails(BusNumber, DriverID, DriverPhone, BusType, NumberOfSeats, BusAvailability) values('UK 07 RN 1289', 104, '+91-7836144528','AC', 46, 0)

Select * from BusDetails

create table Trip(
TID int constraint pk_TripID primary key identity(11,1) not null,
BusID int not null,
FromLocation varchar(50) not null,
ToLocation varchar(50) not null,
constraint fk_BusID FOREIGN KEY (BusID)
        REFERENCES BusDetails (BusID)
        ON DELETE CASCADE
        ON UPDATE CASCADE)

drop table Trip

sp_help Trip

insert into Trip(BusID, FromLocation, ToLocation) values(1, 'Hisar', 'Rohtak')
insert into Trip(BusID, FromLocation, ToLocation) values(4, 'Dehradun', 'Delhi')
insert into Trip(BusID, FromLocation, ToLocation) values(2, 'Ludhiana', 'Ambala')
insert into Trip(BusID, FromLocation, ToLocation) values(1, 'Panchkula', 'Karnal')
insert into Trip(BusID, FromLocation, ToLocation) values(2, 'Amritsar', 'Rajpura')
insert into Trip(BusID, FromLocation, ToLocation) values(3, 'Delhi', 'Jaipur')

Select * from Trip

create table JourneyRoutes(
RouteID int constraint pk_RouteID primary key identity(111,1) not null,
TripID int not null,
CompanyName nvarchar(40) default 'Ready Go Bus',
FromLocation varchar(50) not null,
ToLocation varchar(50) not null,
FromDate date not null,
ToDate date not null,
FromTime time not null,
ToTime time not null,
FromDescription nvarchar(150) not null,
ToDescription nvarchar(150) not null,
Fare int not null,
NumberOfSeats int not null,
constraint fk_TripID FOREIGN KEY (TripID)
        REFERENCES Trip (TID)
        ON DELETE CASCADE
        ON UPDATE CASCADE)

sp_help JourneyRoutes

drop table JourneyRoutes

insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(11, 'Hisar', 'Rohtak', '2020-08-24', '2020-08-24', '12:30', '14:30', 'ISBT Hisar', 'ISBT Rohtak', 500, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(12, 'Dehradun', 'Delhi', '2020-08-26', '2020-08-26', '10:00', '16:30', 'Dehradun ISBT', 'Kashmere Gate ISBT', 700, 46)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(12, 'Dehradun Premnagar', 'Delhi', '2020-08-26', '2020-08-26', '10:20', '16:30', 'Dehradun Premnagar Chowk', 'Kashmere Gate ISBT', 700, 46)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(13, 'Ludhiana ISBT', 'Ambala Flyover', '2020-08-28', '2020-08-28', '7:00', '9:00', 'Outside Ludhiana Bus Stand Main Gate-1', 'Starting of the Ambala Cantt. Flyover,Main', 350, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(13, 'Ludhiana Sherpur Chowk', 'Ambala Flyover', '2020-08-28', '2020-08-28', '7:10', '9:00', 'Sherpur Chowk', 'Starting of the Ambala Cantt. Flyover,Main', 350, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(13, 'Ludhiana Jagrawa Pul', 'Ambala Flyover', '2020-08-28', '2020-08-28', '7:30', '9:00', 'Jagrawa Pul', 'Starting of the Ambala Cantt. Flyover,Main', 350, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(14, 'Panckula ISBT', 'Karnal', '2020-08-25', '2020-08-25', '9:10', '11:50', 'Panchkula ISBT Sector-5', 'Karnal ISBT', 200, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(15, 'Amritsar ISBT', 'Rajpura Main Road', '2020-08-24', '2020-08-24', '14:00', '18:00', 'Amritsar ISBT', 'Gagan Chowk', 699, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(15, 'Amritsar Junction Railway Station', 'Rajpura Main Road', '2020-08-24', '2020-08-24', '14:10', '18:00', 'Golden Temple Volvo bus service,Opposite side', 'Gagan Chowk', 699, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(15, 'New Amritsar Red Light', 'Rajpura Main Road', '2020-08-24', '2020-08-24', '14:20', '18:00', 'New Amritsar Red Light GT Road', 'Gagan Chowk', 699, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(16, 'Delhi', 'Jaipur Bus Stand', '2020-08-26', '2020-08-26', '20:00', '02:30', 'Delhi Kashmere Gate ISBT', 'Bus Stand(Sindhi Camp)', 1000, 40)
insert into JourneyRoutes(TripID, FromLocation, ToLocation, FromDate, ToDate, FromTime, ToTime, FromDescription, ToDescription, Fare, NumberOfSeats) values(16, 'Karol Bagh', 'Jaipur Bus Stand', '2020-08-26', '2020-08-26', '20:30', '02:30', 'Karol Bagh, Near DTC Bus Stand', 'Bus Stand(Sindhi Camp)', 1000, 40)

Select * from JourneyRoutes

create table Admin(
ID int constraint pk_AdminID primary key not null,
username nvarchar(40) not null,
password nvarchar(40) not null)

sp_help Admin

insert into admin values(1,'Raman','upwrd@123')

Select * from Admin

create table GuestUserDetails(
GID int constraint pk_GID primary key IDENTITY(5001,1) not null,
FirstName nvarchar(50) not null,
Lastname nvarchar(50) not null,
EmailId nvarchar(50) not null,
PhoneNumber varchar(15))

sp_help GuestUserDetails

insert into GuestUserDetails(FirstName, Lastname, EmailId, PhoneNumber) values('Mukul','Yadav','mukulyadav@gmail.com','+91-9812134341')
insert into GuestUserDetails(FirstName, Lastname, EmailId, PhoneNumber) values('Sameer','Gulati','sg@gmail.com','+91-9812134340')

Select * from GuestUserDetails

create table UserDetails(
UID int constraint pk_UID primary key IDENTITY(1001,1) not null,
Password nvarchar(30) not null,
Gender nvarchar(30) not null,
DOB date not null,
Address nvarchar(100) not null,
State nvarchar(50) not null,
City nvarchar(50) not null,
Pincode int not null,
PhoneNumber varchar(15) not null,
Wallet int not null,
GuestID int not null,
constraint fk_GuestID FOREIGN KEY (GuestID)
        REFERENCES GuestUserDetails (GID)
)

sp_help UserDetails

insert into UserDetails(Password, Gender, DOB, Address, State, City, Pincode, PhoneNumber, Wallet, GuestID) values('m@yadav123', 'Male', '1997-12-10', 'Block-J 121', 'Haryana', 'Hisar', 125001, '+91-9812134341', 500, 5001)
insert into UserDetails(Password, Gender, DOB, Address, State, City, Pincode, PhoneNumber, Wallet, GuestID) values('sgulati@1234', 'Male', '1992-07-12', 'N 405 Sector-10 A', 'Punjab', 'Ludhiana', 141001, '+91-9812134340', 200, 5002)

Select * from UserDetails

create table Ticket(
TicketID int constraint pk_Ticket primary key IDENTITY(107201,1) not null,
BusID int not null,
BookingUserID int not null,
FromLocation varchar(50) not null,
ToLocation varchar(50) not null,
FromDate date not null,
ToDate date not null,
FromTime time not null,
ToTime time not null,
TicketBookingStatus int not null,
NumberOfSeats int not null,
Fare int not null,
PaymentStatus bit not null
constraint fk_BID FOREIGN KEY (BusID)
        REFERENCES BusDetails (BusID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
constraint fk_BookingUserID FOREIGN KEY (BookingUserID)
        REFERENCES UserDetails (UID)
)

sp_help Ticket

create table Feedback(
PNR int not null,
JourneyRatings int not null,
Comments nvarchar(200),
constraint fk_PNR FOREIGN KEY (PNR)
        REFERENCES Ticket (TicketID))

sp_help Feedback

create table TransactionDetails(
TransactionID int constraint pk_TransactionID primary key IDENTITY(10556141,1) not null,
PNR int not null,
PaymentDate date not null,
PaymentTime time not null,
Amount int not null, 
ModeOfPayment nvarchar(40) not null,
PaymentStatus bit not null,
constraint fk_Ticketid FOREIGN KEY (PNR)
        REFERENCES Ticket (TicketID))

sp_help TransactionDetails

create table PassengerDetails(
PNR int not null, 
PassengerName nvarchar(50) not null, 
Gender nvarchar(40) not null,
Age int not null,
SeatNumber int constraint uk_SeatNumber unique not null,
BookingStatus bit not null,
constraint fk_Ticket_id FOREIGN KEY (PNR)
        REFERENCES Ticket (TicketID))

sp_help PassengerDetails

select * from Admin
select * from GuestUserDetails
select * from UserDetails
select * from DriverDetails
select * from BusDetails
select * from Trip
select * from JourneyRoutes
select * from Ticket
select * from PassengerDetails
select * from TransactionDetails
select * from Feedback