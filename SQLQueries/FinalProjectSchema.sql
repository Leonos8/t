Create DATABASE IF NOT EXISTS Accounts;
USE Accounts;

Create TABLE IF NOT EXISTS Administrator
(
	uid int unique not null,
	username varchar(256) not null,
    password varchar(256) not null,
    email varchar(256) not null,
    phone varchar(256) not null,
	lastAccessed datetime not null,
    isActive bool not null,
    primary key(uid)
);

Create TABLE IF NOT EXISTS custRep
(
	uid int unique not null,
	username varchar(256) not null,
    password varchar(256) not null,
    email varchar(256) not null,
    phone varchar(256) not null,
	lastAccessed datetime not null,
    isActive bool not null,
    primary key(uid)
);

Create TABLE IF NOT EXISTS endUsers
(
	uid int unique not null,
	username varchar(256) not null,
    password varchar(256) not null,
    email varchar(256) not null,
    phone varchar(256) not null,
	lastAccessed datetime not null,
    isActive bool not null,
    primary key(uid)
);

Create DATABASE IF NOT EXISTS Auctions;
USE Auctions;

Create TABLE IF NOT EXISTS Auction
(
	auctId int unique not null,
    createdBy varchar(256) not null,
    createdDate datetime not null,
    endDate datetime not null,
    isActive boolean not null,
    initialAmount decimal(15, 2) not null,
    increment decimal(15,2) not null,
    reserveAmount decimal(15, 2) not null,
    winningUser varchar(256), 
    winningBidID varchar(256), 
    winningBid decimal(15, 2),
    primary key(auctId)
);

Create TABLE IF NOT EXISTS Bid
(
	auctID int not null,
	bidID int not null,
    amt decimal(15, 2) not null,
    maxBid decimal(15, 2),
    createdBy varchar(32) not null,
    dt datetime not null,
    isActive boolean,
    primary key(bidID)
);

Create TABLE IF NOT EXISTS Item
(
	auctID int unique not null,
	itemID int unique not null,
    category varchar(256),
    subcategory varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Clothing
(
	itemID int not null,
    subcategory varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Bracelet
(
	itemID int not null,
    company varchar(256),
    size varchar(256),
    material varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Earrings
(
	itemID int not null,
    company varchar(256),
    material varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Hats
(
	itemID int not null,
    style varchar(256),
    size varchar(256),
    color varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Necklace
(
	itemID int not null,
    company varchar(256),
    size varchar(256),
    material varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Pants
(
	itemID int not null,
    company varchar(256),
    mf char,
    size varchar(256),
    material varchar(256),
    color varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Shirts
(
	itemID int not null,
    company varchar(256),
    mf char,
    size varchar(256),
    material varchar(256),
    color varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Shoes
(
	itemID int not null,
    company varchar(256),
    model varchar(256),
    mf char,
    size varchar(256),
    color varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Socks
(
	itemID int not null,
    company varchar(256),
    size varchar(256),
    color varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Undergarments
(
	itemID int not null,
    company varchar(256),
    size varchar(256),
    color varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Watch
(
	itemID int not null,
    company varchar(256),
    model varchar(256),
    color varchar(256),
    material varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Computers
(
	itemID int not null,
    subcategory varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS AIO
(
	itemID int not null,
    yearMade varchar(256),
    company varchar(256),
    model varchar(256),
    screensize varchar(256),
    color varchar(256),
    processor varchar(256),
    gpu varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Desktop
(
	itemID int not null,
    yearMade varchar(256),
    company varchar(256),
    model varchar(256),
    color varchar(256),
    processor varchar(256),
    gpu varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Laptop
(
	itemID int not null,
    yearMade varchar(256),
    company varchar(256),
    model varchar(256),
    screensize varchar(256),
    color varchar(256),
    processor varchar(256),
    gpu varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Vehicles
(
	itemID int not null,
    subcategory varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Airplane
(
	itemID int not null,
    bodytype varchar(256),
    yearMade varchar(256),
    make varchar(256),
    model varchar(256),
    itemCondition varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Boat
(
	itemID int not null,
    bodytype varchar(256),
    yearMade varchar(256),
    make varchar(256),
    model varchar(256),
    itemCondition varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Bus
(
	itemID int not null,
    bodytype varchar(256),
    yearMade varchar(256),
    make varchar(256),
    model varchar(256),
    itemCondition varchar(256),
    mileage varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Car
(
	itemID int not null,
    bodytype varchar(256),
    yearMade varchar(256),
    make varchar(256),
    model varchar(256),
    color varchar(256),
    itemCondition varchar(256),
    mileage varchar(256),
    fueltype varchar(256),
    transmission varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Motorcycle
(
	itemID int not null,
    bodytype varchar(256),
    yearMade varchar(256),
    make varchar(256),
    model varchar(256),
    color varchar(256),
    itemCondition varchar(256),
    mileage varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Offroad
(
	itemID int not null,
    bodytype varchar(256),
    yearMade varchar(256),
    make varchar(256),
    model varchar(256),
    itemCondition varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Truck
(
	itemID int not null,
    bodytype varchar(256),
    yearMade varchar(256),
    make varchar(256),
    model varchar(256),
    itemCondition varchar(256),
    mileage varchar(256),
    PRIMARY KEY(itemID)
);

Create TABLE IF NOT EXISTS Other
(
	itemID int not null,
    itemName varchar(256),
    itemDescription varchar(512),
    PRIMARY KEY(itemID)
);

Create DATABASE IF NOT EXISTS Forum;
Use Forum;

Create TABLE IF NOT EXISTS Questions
(
	questionID int not null,
    title varchar (256) not null,
    Question varchar(1024),
    askedBy varchar(32) not null,
    dtAsked datetime not null,
    PRIMARY KEY(questionID)
);

Create TABLE IF NOT EXISTS Answers
(
	answerID int not null,
    questionID int not null,
    answer varchar(1024) not null,
    answerUser varchar(32) not null,
    dtAnswered datetime not null,
	PRIMARY KEY(answerID)
);

#######################################################################################

Create TABLE IF NOT EXISTS Car #removable
(
	vin int,
    cid int,
    primary key(vin,cid),
    foreign key (vin) references Item(vin)
);

Create TABLE IF NOT EXISTS Motorcycle #removable
(
	vin int,
    mid int,
    primary key(vin, mid),
    foreign key (vin) references Item(vin)
);

Create TABLE IF NOT EXISTS Truck #removable
(
	vin int,
    tid int,
    primary key(vin,tid),
    foreign key (vin) references Item(vin)
);

Create TABLE IF NOT EXISTS formulates
(
	num int,
    id int,
    primary key(num,id),
    foreign key(num) references Reports(num),
    foreign key(id) references Administrator(id)
);

Create TABLE IF NOT EXISTS makesAcc
(
	aid int,
    cid int,
    primary key(aid,cid),
    foreign key(aid) references Administrator(id),
    foreign key(cid) references custRep(id)
);

Create TABLE IF NOT EXISTS availTo
(
	cid int,
    uname varchar(20),
    primary key(cid,uname),
    foreign key(cid) references custRep(id),
    foreign key(uname) references endUsers(uname)
);

Create TABLE IF NOT EXISTS edits
(
	auctId int,
    cid int,
    primary key(auctId, cid),
    foreign key(auctId) references Auction(auctId),
    foreign key(cid) references custRep(id)
);

Create TABLE IF NOT EXISTS isPartOf
(
	vin int,
    auctId int,
    primary key(vin,auctId),
    foreign key(vin) references Item(vin), 
    foreign key(auctId) references Auction(auctId)
);

Create TABLE IF NOT EXISTS places
(
	buyerId int,
    uname varchar(20),
    bidNum int,
    primary key(buyerId, uname, bidNum),
    foreign key(buyerId,uname) references Buyer(buyerId,uname),
    foreign key(bidNum) references Bid(bidNum)
);

Create TABLE IF NOT EXISTS puts
(
	sellerId int,
    uname varchar(20),
    askNum int,
    primary key(sellerId, uname, askNum),
    foreign key(sellerId,uname) references Seller(sellerId,uname),
    foreign key(askNum) references Ask(askNum)
);
    
Create TABLE IF NOT EXISTS bidOn
(
	bidNum int,
    vin int,
    primary key(bidNum),
    foreign key(bidNum) references Bid(bidNum),
    foreign key(vin) references Item(vin)
);

Create TABLE IF NOT EXISTS askOn
(
	askNum int,
    vin int,
    primary key(askNum),
    foreign key(askNum) references Ask(askNum),
    foreign key(vin) references Item(vin)
);

Create TABLE IF NOT EXISTS hasBidHistory
(
	auctID int,
    amount float,
    dt date,
    tm time,
    primary key(auctID), 
    foreign key(auctID) references Auction(auctID)
);