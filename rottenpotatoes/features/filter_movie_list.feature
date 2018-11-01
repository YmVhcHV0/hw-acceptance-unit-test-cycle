Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
      | title        | rating | director     | release_date |
      | Star Wars    | PG     | George Lucas | 1977-05-25   |
      | Blade Runner | PG     | Ridley Scott | 1982-06-25   |
      | Alien        | R      |              | 1979-05-25   |
      | THX-1138     | R      | George Lucas | 1971-03-11   |


  And  I am on the RottenPotatoes home page
  Then 4 seed movies should exist

Scenario: restrict to movies with 'PG' or 'R' ratings
  Given I am on the RottenPotatoes home page
  When I check the following ratings: "ratings_PG", "ratings_R"
  And I uncheck the following ratings: "ratings_PG-13", "ratings_G"
  Then I press "ratings_submit"
  Then I should see all the movies
  # enter step(s) to check the 'PG' and 'R' checkboxes
  # enter step(s) to uncheck all other checkboxes
  # enter step to "submit" the search form on the homepage
  # enter step(s) to ensure that PG and R movies are visible
  # enter step(s) to ensure that other movies are not visible

Scenario: all ratings selected
  Given I am on the RottenPotatoes home page
  When I check the following ratings: "ratings_PG", "ratings_R", "ratings_PG-13", "ratings_G"
  Then I press "ratings_submit"
  Then I should see all the movies
  
