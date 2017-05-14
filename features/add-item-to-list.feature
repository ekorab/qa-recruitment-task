Feature: As a user I want to add a to-do item to my to-do list, so that I don't forget it.

  Scenario: 1. Save items in empty do-to list
    Given I am on empty do-to list
    When  I save the following items in the list
      | wake up                        |
      | prepare to start wonderful day |
      | go out and start creating      | 
    Then I see the following items saved in to-do list
	  | wake up                        |
      | prepare to start wonderful day |
      | go out and start creating      | 
	And I see "3 items left" information

  Scenario: 2. Edit item in do-to list
    Given I am in the to-do list with "prepare task for QA" item
    And I double click "prepare task for QA"  
    When I edit item name to "prepare task for DEV"
	Then I see the following items saved in to-do list
	  | prepare task for DEV |
	  
  Scenario Outline: 3. Delete item from do-to list
    Given I am in the to-do list with "<name>" item
    When I delete "<name>" item from the list
    Then I am on empty do-to list
	And I see "0 items left" information
	Examples: 
	  | name                                 |
	  | first basic example of my to-do item |
	  | another item                         |
	  
  Scenario: 4. Reopen to-do list to check if item saved previously is still available
    Given I am on empty do-to list
    And I save the following items in the list
      | remember to come back here |
    When I close to-do list
	And I open to-do list again
	Then I see the following items saved in to-do list
	  | remember to come back here |
	  
  Scenario: 5. Empty item cannot be saved
    Given I am on empty do-to list
    When I try to save empty item in the list
	Then I see "0 items left" information	

  Scenario: 6. Two items with the same name cannot be saved in the list
    Given I am in the to-do list with "unique" item
    When I save the following items in the list
      | unique |
	Then I see the following items saved in to-do list
	  | unique |
    And I see "1 items left" information