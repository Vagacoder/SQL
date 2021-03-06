create table Rep
(

    RepNum		char(2)		not NULL,

    LastName	char(15)	not null,

    FirstName	char(15)	not null,

    Street		char(15)	null,

    City		char(15)	null,

    State		char(2)	null,

    PostalCode	char(5)	null,

    Commision	decimal(7,2)	null,

    Rate		decimal(3,2)	null
);



create table Customer
(
 CustomerNum    int(10)  NOT NULL ,

  CustomerName  char(50)  NOT NULL ,

  Street		char(50)  NULL ,

  City    		char(50)  NULL ,

  State   		char(5)   NULL ,

  PostalCOde    char(10)  NULL ,

  Balance		decimal(20)	null,

  CreditLimit    decimal(50) NULL,

  RepNum		int(10)	not null
);



create table Orders
(
	OrderNum	int(10)		not null,
    OrderDate	date		not null,

    CustomerNum	int(10)		not null
);



create table OrderLine
(

	OrderNum	int(10)		not null,

    ItenNum		char(10)	not null,
    NumOrdered	int(20)		not null,

    QuotedPrice	decimal(20)	not null
);



create table item
(

    ItenNum		char(10)	not null,

    Description	char(100)	null,

    OnHand		int(20)		null,

    Category	char(10)	not null,

    Storehouse	int(10)		not null,

    Price		decimal(10)	not null
);


