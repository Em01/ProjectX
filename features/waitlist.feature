Feature: The waiting list
	In order to see if people are waiting to buy my listing
	As a seller
	I know if there are none, one, or more

Background: Being logged in and on the page of your own listing
	Given Ollie is signed in
	And Ollie has one football for sale
	And Ollie visits "dashboard"

Scenario: A seller can see if no-one is on the waitlist
	Given no users have clicked the want button on Ollie's football
	Then Ollie should see "0 in queue"

Scenario: A seller can see if there is one person on the waitlist
	Given one user has clicked the want button on Ollie's football
	Then Ollie should see "1 in queue"

Scenario: A seller can see if there is more than one person on the waitlist
	Given two users have clicked the want button on Ollie's football
	Then Ollie should see "1+ in queue"

