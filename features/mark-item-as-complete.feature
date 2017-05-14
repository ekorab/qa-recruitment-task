Feature: As a user I want to mark my to-do item as complete, so that I keep my list up-to-date.

  Background:
    Given I am on empty do-to list
	
  Scenario Outline: 1. Item on to-do list is saved as active by default
    When I save the following items in the list 
      | active item just saved |
    And I select "<item-type>" filter in to-do list
    Then I see the following items saved in to-do list
      | active item just saved |
    And I see "1 item left" information
    Examples:
      | item-type |
      | All       |
      | Active    |
 
  Scenario: 2. Item can be marked as complete correctly
    And I save the following items in the list 
      | item to be marked as complete |
    And I select "Completed" filter in to-do list
    And I am on empty do-to list
    And I select "All" filter in to-do list
    When I mark "item to be marked as complete" as complete
    And I select "Completed" filter in to-do list
    Then I see the following items saved in to-do list
      | item to be marked as complete |
	  
  Scenario: 3. Completed item can be cleared
    And I save the following items in the list 
      | item to clear |	
    And I mark "item to clear" as complete
    And I see the following items saved in to-do list
      | item to clear |
    When I select "Clear completed" option
    And I select "Completed" filter in to-do list
    Then I am on empty do-to list
	
  Scenario: 4. Completed items are not shown in active items list
    And I save the following items in the list 
      | another item |	
    And I mark "another item" as complete
    And I select "Active" filter in to-do list
    Then I am on empty do-to list
	
  Scenario: 5. "Clear completed" option is not available for list with active item
    When I save the following items in the list 
      | item |	 
    Then "Clear Completed" option is not available  
    And I see "1 item left" information
	
  Scenario: 6. Verify multiple items with different statuses 
    And I save the following items in the list 
      | item 1 |
      | item 2 |
      | item 3 |
    When I mark "item 2" as complete
    And I select "Active" filter in to-do list
    Then I see the following items saved in to-do list
      | item 1 |
      | item 3 |
    And I select "Completed" filter in to-do list
    Then I see the following items saved in to-do list
      | item 2 |
    And I see "1 item left" information