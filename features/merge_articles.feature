Feature: Merge Articles
  As a blog administrator
  In order to avoid duplication
  I want to be able to combine two articles into one.

#  A non-admin cannot merge articles.
#  When articles are merged, the merged article should contain the text of both previous articles.
#  When articles are merged, the merged article should have one author (either one of the authors of the two original articles).
#  Comments on each of the two original articles need to all carry over and point to the new, merged article.
#  The title of the new article should be the title from either one of the merged articles.
#  The form field containing the ID of the article to merge with must have the HTML attribute name set to merge_with.
#  The merge interface should not be presented for new articles.

  Background:
    Given the blog is set up
    And the following articles exist:
    | To be merged 1 | Body text 1 |
    | To be merged 2 | Body text 1 |

  Scenario: Merge feature should not be offered when creating a new articles
    Given I am on the new article page
    Then I should not see "Merge Articles"

  Scenario: Non-admin cannot merge articles (sad path)
    Given I am on the edit page for "To be merged 1"
    Then I should not see "Merge Articles"

  Scenario: Successfully merge two articles
    Given I am logged into the admin panel
    And I am on the edit page for "To be merged 1"
    Then I should see "Merge Articles"
    When I enter the article ID of "To be merged 2" into the "merge_with" field
    And I follow "merge_link"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "To be merged 1"
    But I should not see "To be merged 2"
    When I follow "To be merged 1"
    Then I should see "Body text 1"
    And I should see "Body text 1"



