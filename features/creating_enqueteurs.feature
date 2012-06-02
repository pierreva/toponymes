Feature: Creating enqueteurs
	In order to have enqueteurs to assign tickets to
	As a user
	I want to create them easily
	Scenario: Creating a enqueteur
		Given I am on the homepage
		When I follow "New enqueteur"
		And I fill in "Name" with "TextMate 2"
		And I press "Create enqueteur"
		Then I should see "enqueteur has been created."