Feature: User can access the site with facebook
  
  As a user of the system
  In order to simplify the sign up/sign in process
  I would like to be able to authenticate myself using Facebook

  Background:
    Given we have 1 laundry

  Scenario: Visitor can click 'Login with facebook' and be authorized
    Given I am on the "Landing" page
    And I click "Login with Facebook"
    Then I should be redirected to index page
    And I should see "Successfully authenticated from Facebook account"
   