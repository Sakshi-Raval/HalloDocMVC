DROP TABLE  IF EXISTS Admin ;
CREATE TABLE Admin (
	AdminId SERIAL PRIMARY KEY,
	AspNetUserId VARCHAR(128) NOT NULL REFERENCES AspNetUsers(Id),
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100),
	Email VARCHAR(50) NOT NULL,
	Mobile VARCHAR(20),
	Address1 VARCHAR(500),
	Address2 VARCHAR(500),
	City VARCHAR(100),
	RegionId INT,
	Zip VARCHAR(10),
	AltPhone VARCHAR(20),
	CreatedBy VARCHAR(128) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	ModifiedBy VARCHAR(128),
	ModifiedDate TIMESTAMP,
	Status SMALLINT,
	IsDeleted bit,
	RoleId INT
);

DROP TABLE IF EXISTS AdminRegion ;
	CREATE TABLE AdminRegion (
	AdminRegionId SERIAL PRIMARY KEY,
	AdminId INT NOT NULL REFERENCES Admin(AdminId),
	RegionId INT NOT NULL REFERENCES Region(RegionId)
);

DROP TABLE IF EXISTS AspNetRoles ;
CREATE TABLE AspNetRoles(
	Id varchar(128) NOT NULL PRIMARY KEY,
	Name varchar(256) NOT NULL 
);

DROP TABLE IF EXISTS AspNetUsers ;
CREATE TABLE AspNetUsers(
	Id varchar(128) NOT NULL PRIMARY KEY,
	UserName varchar(256) NOT NULL,
	PasswordHash varchar,
	Email varchar(256),
	PhoneNumber varchar(20),
	IP varchar(20),
	CreatedDate timestamp NOT NULL,
	ModifiedDate timestamp
);

DROP TABLE IF EXISTS AspNetUserRoles ;
CREATE TABLE AspNetUserRoles (
UserId VARCHAR(128) NOT NULL REFERENCES AspNetUsers(Id),
RoleId VARCHAR(128) NOT NULL,
PRIMARY KEY (UserId, RoleId)
);

DROP TABLE IF EXISTS BlockRequests ;
CREATE TABLE BlockRequests(
	BlockRequestId SERIAL NOT NULL PRIMARY KEY,
	PhoneNumber varchar(50), 
	Email varchar(50), 
	IsActive bit, 
	Reason varchar,
	RequestId varchar(50) NOT NULL,
	IP varchar(20),
	CreatedDate timestamp,
	ModifiedDate timestamp
);

DROP TABLE IF EXISTS Business;
CREATE TABLE Business (
	BusinessId SERIAL PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Address1 VARCHAR(500),
	Address2 VARCHAR(500),
	City VARCHAR(50),
	RegionId INT REFERENCES Region(RegionId),
	ZipCode VARCHAR(10),
	PhoneNumber VARCHAR(20),
	FaxNumber VARCHAR(20),
	IsRegistered bit,
	CreatedBy VARCHAR(128),
	CreatedDate TIMESTAMP NOT NULL,
	ModifiedBy VARCHAR(128),
	ModifiedDate TIMESTAMP,
	Status SMALLINT,
	IsDeleted bit,
	IP VARCHAR(20)
);

DROP TABLE IF EXISTS CaseTag ;
CREATE TABLE CaseTag(
	CaseTagId int NOT NULL,
	Name varchar(50) NOT NULL
);

DROP TABLE IF EXISTS Concierge;
CREATE TABLE Concierge (
	ConciergeId SERIAL PRIMARY KEY,
	ConciergeName VARCHAR(100) NOT NULL,
	Address VARCHAR(150),
	Street VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	State VARCHAR(50) NOT NULL,
	ZipCode VARCHAR(50) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	RegionId INT REFERENCES Region(RegionId),
	RoleId 	VARCHAR(20)  
);

DROP TABLE IF EXISTS EmailLog ;
CREATE TABLE EmailLog (
	EmailLogID DECIMAL(9) NOT NULL PRIMARY KEY,
	EmailTemplate VARCHAR,
	SubjectName VARCHAR(200) NOT NULL,
	EmailID VARCHAR(200) NOT NULL,
	ConfirmationNumber VARCHAR(200),
	FilePath VARCHAR,
	RoleId INT,
	RequestId INT,
	AdminId INT,
	PhysicianId INT,
	CreateDate TIMESTAMP NOT NULL,
	SentDate TIMESTAMP,
	IsEmailSent bit,
	SentTries INT,
	Action INT
);

DROP TABLE IF EXISTS HealthProfessionals ;
CREATE TABLE HealthProfessionals (
	VendorId SERIAL PRIMARY KEY,
	VendorName VARCHAR(100) NOT NULL,
	Profession INT REFERENCES HealthProfessionalType(HealthProfessionalId),
	FaxNumber VARCHAR(50) NOT NULL,
	Address VARCHAR(150),
	City VARCHAR(100),
	State VARCHAR(50),
	Zip VARCHAR(50),
	RegionId INT,
	CreatedDate TIMESTAMP NOT NULL,
	ModifiedDate TIMESTAMP,
	PhoneNumber VARCHAR(100),
	IsDeleted bit,
	IP VARCHAR(20),
	Email VARCHAR(50),
	BusinessContact VARCHAR(100)
);

DROP TABLE IF EXISTS HealthProfessionalType;
CREATE TABLE HealthProfessionalType (
	HealthProfessionalId SERIAL PRIMARY KEY,
	ProfessionName VARCHAR(50) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	IsActive BIT,
	IsDeleted BIT
);

DROP TABLE IF EXISTS Menu;
CREATE TABLE Menu (
	MenuId SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	AccountType SMALLINT NOT NULL CHECK (AccountType IN(1,2)),
	SortOrder INT
);

DROP TABLE IF EXISTS OrderDetails ;
CREATE TABLE OrderDetails (
	Id SERIAL PRIMARY KEY,
	VendorId INT,
	RequestId INT,
	FaxNumber VARCHAR(50),
	Email VARCHAR(50),
	BusinessContact VARCHAR(100),
	Prescription VARCHAR,
	NoOfRefill INT,
	CreatedDate TIMESTAMP,
	CreatedBy VARCHAR(100)
);

DROP TABLE IF EXISTS Physician;
CREATE TABLE Physician(
	PhysicianId SERIAL PRIMARY KEY,
	AspNetUserId VARCHAR(128) REFERENCES AspNetUsers(Id),
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100),
	Email VARCHAR(50) NOT NULL,
	Mobile VARCHAR(20),
	MedicalLicense VARCHAR(500),
	Photo VARCHAR(100),
	AdminNotes VARCHAR(500),
	IsAgreementDoc BIT,
	IsBackgroundDoc BIT,
	IsTrainingDoc BIT,
	IsNonDisclosureDoc BIT,
	Address1 VARCHAR(500),
	Address2 VARCHAR(500),
	City VARCHAR(100),
	RegionId INT,
	Zip VARCHAR(10),
	AltPhone VARCHAR(20),
	CreatedBy VARCHAR(500) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	ModifiedBy VARCHAR(500),
	ModifiedDate TIMESTAMP,
	Status SMALLINT,
	BusinessName VARCHAR(100) NOT NULL,
	BusinessWebsite VARCHAR(200) NOT NULL, 
	IsDeleted BIT,
	RoleId INT,
	NPINumber VARCHAR(500),
	IsLicenseDoc BIT,
	Signature VARCHAR(100),
	IsCredentialDoc BIT,
	IsTokenGenerate BIT,
	SyncEmailAddress VARCHAR(50)
);

DROP TABLE IF EXISTS PhysicianLocation ;
CREATE TABLE PhysicianLocation (
	LocationId INT NOT NULL,
	PhysicianId INT REFERENCES Physician(PhysicianId),
	Latitude DECIMAL(9,2),
	Longitude DECIMAL(9,2),
	CreatedDate TIMESTAMP,
	PhysicianName VARCHAR(50),
	Address VARCHAR(500)
);

DROP TABLE IF EXISTS PhysicianNotification;
CREATE TABLE PhysicianNotification (
	id SERIAL PRIMARY KEY,
	PhysicianId INT REFERENCES Physician(PhysicianId),
	IsNotificationStopped BIT
);

DROP TABLE IF EXISTS  PhysicianRegion;
CREATE TABLE PhysicianRegion (
	PhysicianRegionId SERIAL PRIMARY KEY,
	PhysicianId INT REFERENCES Physician(PhysicianId),
	RegionId INT REFERENCES Region(RegionId)
);

DROP TABLE IF EXISTS Region ;
CREATE TABLE Region (
	RegionId SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Abbreviation VARCHAR(50)
);

DROP TABLE IF EXISTS Request;
CREATE TABLE Request (
	RequestId SERIAL PRIMARY KEY,
	RequestTypeId INT NOT NULL CHECK(RequestTypeId IN(1,2,3,4)),
	UserId INT REFERENCES Users(UserId),
	FirstName VARCHAR(100),
	LastName VARCHAR(100),
	PhoneNumber VARCHAR(23),
	Email VARCHAR(50),
	Status SMALLINT NOT NULL CHECK(Status BETWEEN 1 AND 15),
	PhysicianId INT REFERENCES Physician(PhysicianId),
	ConfirmationNumber VARCHAR(20),
	CreatedDate TIMESTAMP NOT NULL,
	IsDeleted BIT,
	ModifiedDate TIMESTAMP,
	DeclinedBy VARCHAR(250),
	IsUrgentEmailSent BIT NOT NULL,
	LastWellnessDate TIMESTAMP,
	IsMobile BIT,
	CallType SMALLINT,
	CompletedByPhysician BIT,
	LastReservationDate TIMESTAMP,
	AcceptedDate TIMESTAMP,
	RelationName VARCHAR(100),
	CaseNumber VARCHAR(50),
	IP VARCHAR(20),
	CaseTag VARCHAR(50),
	CaseTagPhysician VARCHAR(50),
	PatientAccountId VARCHAR(128),
	CreatedUserId INT
);

DROP TABLE IF EXISTS RequestBusiness;
CREATE TABLE RequestBusiness (
	RequestBusinessId SERIAL PRIMARY KEY,
	RequestId INT NOT NULL REFERENCES Request(RequestId),
	BusinessId INT NOT NULL REFERENCES Business(BusinessId),
	IP VARCHAR(20)
);

DROP TABLE IF EXISTS RequestClient;
CREATE TABLE RequestClient (
	RequestClientId SERIAL PRIMARY KEY,
	RequestId INT NOT NULL REFERENCES Request(RequestId),
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100),
	PhoneNumber VARCHAR(23),
	Location VARCHAR(100),
	Address VARCHAR(500),
	RegionId INT REFERENCES Region(RegionId),
	NotiMobile VARCHAR(20),
	NotiEmail VARCHAR(50),
	Notes VARCHAR(500),
	Email VARCHAR(50),
	strMonth VARCHAR(20),
	intYear INT,
	intDate INT,
	IsMobile BIT,
	Street VARCHAR(100),
	City VARCHAR(100),
	State VARCHAR(100),
	ZipCode VARCHAR(10),
	CommunicationType SMALLINT,
	RemindReservationCount SMALLINT,
	RemindHouseCallCount SMALLINT,
	IsSetFollowupSent SMALLINT,
	IP VARCHAR(20),
	IsReservationReminderSent SMALLINT,
	Latitude DECIMAL(9,2),
	Longitude DECIMAL(9,2)
);

DROP TABLE IF EXISTS RequestClosed;
CREATE TABLE RequestClosed (
	RequestClosedId SERIAL PRIMARY KEY,
	RequestId INT NOT NULL REFERENCES Request(RequestId),
	RequestStatusLogId INT NOT NULL REFERENCES RequestStatusLog(RequestStatusLogId),
	PhyNotes VARCHAR(500),
	ClientNotes VARCHAR(500),
	IP VARCHAR(20)
);

DROP TABLE IF EXISTS RequestConcierge;
CREATE TABLE RequestConcierge (
	Id SERIAL PRIMARY KEY,
	RequestId INT NOT NULL REFERENCES Request(RequestId),
	ConciergeId INT NOT NULL REFERENCES Concierge(ConciergeId),
	IP VARCHAR(20)
);

DROP TABLE IF EXISTS RequestNotes ;
CREATE TABLE RequestNotes (
	RequestNotesId SERIAL PRIMARY KEY,
	RequestId INT NOT NULL REFERENCES Request(RequestId),
	strMonth VARCHAR(20),
	intYear INT,
	intDate INT,
	PhysicianNotes VARCHAR(500),
	AdminNotes VARCHAR(500),
	CreatedBy VARCHAR(128) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	ModifiedBy VARCHAR(128),
	ModifiedDate TIMESTAMP,
	IP VARCHAR(20),
	AdministrativeNotes VARCHAR(500)
);

DROP TABLE IF EXISTS RequestStatusLog ;
CREATE TABLE RequestStatusLog (
	RequestStatusLogId SERIAL PRIMARY KEY,
	RequestId INT NOT NULL REFERENCES Request(RequestId),
	Status SMALLINT NOT NULL,
	PhysicianId INT REFERENCES Physician(PhysicianId),
	AdminId INT REFERENCES Admin(AdminId),
	TransToPhysicianId INT REFERENCES Physician(PhysicianId),
	Notes VARCHAR(500),
	CreatedDate TIMESTAMP NOT NULL,
	IP VARCHAR(20),
	TransToAdmin BIT
);

DROP TABLE IF EXISTS RequestType ;
CREATE TABLE RequestType (
	RequestTypeId SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS RequestWiseFile ;
CREATE TABLE RequestWiseFile (
	RequestWiseFileID SERIAL PRIMARY KEY,
	RequestId INT NOT NULL REFERENCES Request(RequestId),
	FileName VARCHAR(500) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	PhysicianId INT REFERENCES Physician(PhysicianId),
	AdminId INT REFERENCES Admin(AdminId),
	DocType SMALLINT CHECK(DocType IN(1,2,3)),
	IsFrontSide BIT,
	IsCompensation BIT,
	IP VARCHAR(20),
	IsFinalize BIT,
	IsDeleted BIT,
	IsPatientRecords BIT
);

DROP TABLE IF EXISTS Roles ;
CREATE TABLE Role (
	RoleId SERIAL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	AccountType SMALLINT NOT NULL CHECK (AccountType IN(1,2)),
	CreatedBy VARCHAR(128) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	ModifiedBy VARCHAR(128),
	ModifiedDate TIMESTAMP,
	IsDeleted BIT NOT NULL,
	IP VARCHAR(20)
);

DROP TABLE IF EXISTS RoleMenu ;
CREATE TABLE RoleMenu (
	RoleMenuId SERIAL PRIMARY KEY,
	RoleId INT REFERENCES Role(RoleId),
	MenuId INT REFERENCES Menu(MenuId)
);

DROP TABLE IF EXISTS Shift;
CREATE TABLE Shift (
	ShiftId SERIAL PRIMARY KEY ,
	PhysicianId INT NOT NULL REFERENCES Physician(PhysicianId),
	StartDate DATE NOT NULL,
	IsRepeat BIT NOT NULL,
	WeekDays CHAR(7), 
	RepeatUpto INT, 
	CreatedBy VARCHAR(128) NOT NULL REFERENCES AspNetUsers(Id),
	CreatedDate TIMESTAMP NOT NULL,
	IP VARCHAR(20) 
);

DROP TABLE IF EXISTS ShiftDetail ;
CREATE TABLE ShiftDetail(
	ShiftDetailId SERIAL PRIMARY KEY,
	ShiftId INT NOT NULL REFERENCES Shift(ShiftId),
	ShiftDate TIMESTAMP NOT NULL,
	RegionId INT,
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL,
	Status SMALLINT NOT NULL,
	IsDeleted BIT NOT NULL,
	ModifiedBy VARCHAR(128) REFERENCES AspNetUsers(Id),
	ModifiedDate TIMESTAMP,
	LastRunningDate TIMESTAMP,
	EventId VARCHAR(100),
	IsSync BIT
);

DROP TABLE IF EXISTS ShiftDetailRegion ;
CREATE TABLE ShiftDetailRegion (
	ShiftDetailRegionId SERIAL PRIMARY KEY,
	ShiftDetailId INT NOT NULL REFERENCES ShiftDetail(ShiftDetailId),
	RegionId INT NOT NULL REFERENCES Region(RegionId),
	IsDeleted BOOLEAN
);

DROP TABLE IF EXISTS SMSLog ;
CREATE TABLE SMSLog(
	SMSLogID decimal(9,2) NOT NULL PRIMARY KEY,
	SMSTemplate varchar,
	MobileNumber varchar(50),
	ConfirmationNumber varchar(200),
	RoleId int,
	AdminId int,
	RequestId int,
	PhysicianId int,
	CreateDate timestamp NOT NULL,
	SentDate timestamp,
	IsSMSSent boolean,
	SentTries int NOT NULL,
	Action INT
);

DROP TABLE IF EXISTS Users ;
CREATE TABLE Users (
	UserId SERIAL PRIMARY KEY,
	AspNetUserId VARCHAR(128) REFERENCES AspNetUsers(Id),
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100),
	Email VARCHAR(50) NOT NULL,
	Mobile VARCHAR(20),
	IsMobile BOOLEAN,
	Street VARCHAR(100),
	City VARCHAR(100),
	State VARCHAR(100),
	RegionId INT,
	ZipCode VARCHAR(10),
	strMonth VARCHAR(20),
	intYear INT,
	intDate INT,
	CreatedBy VARCHAR(128) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL,
	ModifiedBy VARCHAR(128),
	ModifiedDate TIMESTAMP,
	Status SMALLINT,
	IsDeleted BOOLEAN,
	IP VARCHAR(20),
	IsRequestWithEmail BOOLEAN
);












