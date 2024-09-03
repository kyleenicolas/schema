 -- Task 1
SELECT * FROM Users 
WHERE DateOfBirth 
BETWEEN '2000-01-01' AND '2004-12-31';

-- Task 2
SELECT * FROM Posts 
WHERE PostedBy = 4;

-- Task 3
SELECT GroupName 
FROM Groups;

--Task 4
SELECT * FROM GroupMembershipRequests 
WHERE GroupMemberUserID = 2;

--Task 5
SELECT * FROM Friends 
WHERE (FriendWhoAdded = 2 OR FriendBeingAdded = 2) AND IsAccepted = TRUE;

--Task 6
SELECT * FROM Friends 
WHERE FriendWhoAdded = 1;

--Task 7
SELECT * FROM Posts 
WHERE GroupID = 2 AND IsPublic = FALSE AND IsOnlyForFriends = FALSE;

--Task 8
SELECT * FROM GroupMembershipRequests 
WHERE GroupID = 2 AND IsGroupMemberShipAccepted = FALSE;




