# AgentBridge
KDCI AgentBridge Project

Project Updates
Uploaded


NEW FEATURES
1) Add a POPs form
       a. add image
       b. zip code field with validation
       c. autopopulate city and state fields based on zip code entered
       d. main property type dropdown selection
       e. subproperty type dropdown selection
       f.  price fields 
       g. property features dropdown selection 
       h. property name field

Estimated time: 2hours 

2) Add a Buyer form
       a. zip code field with validation
       b. autopopulate city and state fields based on zip code entered
       c. main property type dropdown selection
       d. subproperty type dropdown selection
       e.  price fields 
       f. property features dropdown selection 
       g. property name field

Estimated time: 2hours 



MODIFICATIONS TO EXISTING 
1) login hashing (pls ask mark about this)

Estimated time: 1 hour


2) include requirements in setting a new password
    a. must be at least 8 characters
    b. must have at least 1 number
    c.  must have at least 1 upper case letter
    d. must have at least 1 lower case letter

Estimated time: 2hours (I don't remember if this has been implemented before in iOS)

3) Hide my network tab

Estimated time: 1 hour

4) Change logic for search results 
    . a. exclude expired pops
      b. new logic:
           Check if pops is owned by user logged in. If Yes, show pops
           If pops is not owned by user logged in, check the following
             - check if pops is public (value can be taken from public column in the table), if Yes, show POPs
            - if pops is not public, check if viewing user is in network of user logged in, if Yes, check if pops is private. if pops is private check if viewing user has permission to view. If Yes, show pops, if not show black and white photo and pops not clickable
               - if pops is not public and viewing user is not in network of user logged in, dont show POPs

Estimated time: 5hours

    5) change logic for pulling POPs counter for NEW POPs, ALL POPs and Saved POPs (pls ask Mark about this)

Estimated time: 5hours

    6) change logic on sales numbers display for users 

Estimated time: 4hours

    7) change logic on verified logo display for users

Estimated time: 4hours

    8) limit failed login attempts on the app to 5. user will have to click on Reset Password link (reset password redirects to web)

Estimated time: 2hours

    9) modify logic for Invites users in the My Invite tab

Estimated time: 3hours

   10) modify Save POPs function

Estimated time: 4hours


Total hours of work estimated: 36hours 
