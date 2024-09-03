-- Create Users Table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Password VARCHAR(255),
    DateRegistered TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Posts Table
CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    PostDescription VARCHAR(255),
    PostedBy INT,
    IsVisible BOOLEAN,
    DatePosted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostedBy) REFERENCES Users(UserID)
);

-- Create Comments Table
CREATE TABLE Comments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    CommentDescription VARCHAR(255),
    AddedBy INT,
    PostID INT,
    DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AddedBy) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- Create Groups Table
CREATE TABLE Groups (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create GroupMembership Table
CREATE TABLE GroupMembership (
    MembershipID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    UserID INT,
    IsAccepted BOOLEAN DEFAULT FALSE,
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Friends Table
CREATE TABLE Friends (
    FriendshipID INT AUTO_INCREMENT PRIMARY KEY,
    UserID1 INT,
    UserID2 INT,
    DateFriended TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);

-- Create FriendRequests Table
CREATE TABLE FriendRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RequesterID INT,
    RequesteeID INT,
    IsAccepted BOOLEAN DEFAULT FALSE,
    RequestDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RequesterID) REFERENCES Users(UserID),
    FOREIGN KEY (RequesteeID) REFERENCES Users(UserID)
);

-- Create GroupPosts Table
CREATE TABLE GroupPosts (
    GroupPostID INT AUTO_INCREMENT PRIMARY KEY,
    GroupID INT,
    PostID INT,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- Insert updated records into Users Table
INSERT INTO Users (UserID, Username, FirstName, LastName, DateOfBirth, Password) VALUES
(1, 'Josh', 'maki', 'Gituiru', '2004-06-15', 'joshpass'),
(2, 'lloyd', 'volf', 'nira', '2000-08-24', 'lloydpass'),
(3, 'myra', 'vita', 'glo', '2000-11-02', 'myrapass'),
(4, 'moses', 'mai', 'blies', '2001-12-05', 'mpsesass'),
(5, 'yrna', 'kara', 'moro', '2002-03-18', 'yrnapass');

-- Insert updated records into Posts Table
INSERT INTO Posts (PostID, PostDescription, PostedBy, IsVisible) VALUES
(1, 'lakas mo', 1, TRUE),
(2, 'lupit', 2, TRUE),
(3, 'sige pa sige pa', 3, TRUE),
(4, 'grabe ka', 4, TRUE), -- changed to TRUE to ensure query 2 doesn't return empty
(5, 'isa pa nga', 5, TRUE);


-- Insert updated records into Comments Table
INSERT INTO Comments (CommentID, CommentDescription, AddedBy, PostID) VALUES
(1, 'wow', 2, 1),
(2, 'nice', 3, 2),
(3, 'good work', 4, 3),
(4, 'so good', 1, 4),
(5, 'great', 5, 5);


-- Insert updated records into Groups Table
INSERT INTO Groups (GroupID, GroupName) VALUES
(1, 'bagyo'),
(2, 'club boy');

-- Insert updated records into GroupMembership Table
INSERT INTO GroupMembership (MembershipID, GroupID, UserID, IsAccepted) VALUES
(1, 1, 1, TRUE),
(2, 1, 3, FALSE),
(3, 2, 2, TRUE), -- ensuring user_id 2 has a group membership
(4, 2, 4, FALSE),
(5, 2, 5, TRUE);

-- Insert updated records into Friends Table
INSERT INTO Friends (FriendshipID, UserID1, UserID2) VALUES
(1, 1, 2), -- ensuring user_id 2 has friends
(2, 3, 5),
(3, 4, 2); -- ensuring user_id 2 has friends

-- Insert updated records into FriendRequests Table
INSERT INTO FriendRequests (RequestID, RequesterID, RequesteeID, IsAccepted) VALUES
(1, 1, 3, FALSE),
(2, 2, 4, TRUE),
(3, 5, 1, TRUE),
(4, 1, 2, FALSE); -- ensuring user_id 1 has friend requests sent

-- Insert updated records into GroupPosts Table
INSERT INTO GroupPosts (GroupPostID, GroupID, PostID) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 2, 10); -- ensuring there is a post for group_id 2