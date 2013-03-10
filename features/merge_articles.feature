Feature: Merge Articles
  As a blog administrator
  In order to avoid duplication
  I want to be able to combine two articles into one.

  Background:
    Given the blog is set up
    And the following articles exist:
    | To be merged 1 | Body text 1 |
    | To be merged 2 | Body text 1 |

  Scenario: Non-admin cannot merge articles (sad path)
    Given I am on the edit page for "To be merged 1"
    Then I should not see "Merge Articles"

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    Given I am on the edit page for "To be merged 1"
    Then I should see "Merge Articles"
    And I enter the article ID of "To be merged 2"