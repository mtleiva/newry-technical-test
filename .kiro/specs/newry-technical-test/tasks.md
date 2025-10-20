# Implementation Plan

- [x] 1. Set up project structure and documentation

  - Create folder structure for ProgrammingExercises, DatabaseDesign, and WebQuestionnaire
  - Update README.md with project overview and instructions
  - _Requirements: 1.1, 2.1, 3.1, 4.1_

- [x] 2. Implement Programming Exercise 1 - Even/Odd Separator (C#)


  - [x] 2.1 Create EvenOddSeparator class with Separate method

    - Implement algorithm using modulo operator to separate even and odd numbers
    - Handle zero as even number
    - Return tuple with both lists
    - _Requirements: 1.1, 1.3, 1.5_

  - [x] 2.2 Create Program.cs with console application

    - Implement Main method to demonstrate the solution
    - Test with provided example: {4,6,9,1,0,4,3,2,5,8,3,7}
    - Display results in console
    - _Requirements: 1.6_

  - [x] 2.3 Add pseudocode comments to the implementation

    - Document algorithm steps in comments
    - Explain logic for even/odd determination
    - _Requirements: 1.4_

  - [x] 2.4 Write unit tests for Exercise 1

    - Test with provided example input
    - Test with empty list
    - Test with single element
    - Test with all even numbers
    - Test with all odd numbers
    - Test that zero is treated as even
    - _Requirements: 1.6_

- [x] 3. Implement Programming Exercise 2 - Vowel Counter (C#)


  - [x] 3.1 Create VowelCounter class with CountVowels method



    - Implement algorithm to count vowel occurrences
    - Track words containing each vowel using HashSet
    - Handle both uppercase and lowercase vowels
    - Return dictionary with vowel statistics
    - _Requirements: 1.2, 1.3_

  - [x] 3.2 Create Program.cs with console application



    - Implement Main method to demonstrate the solution
    - Test with provided example: "El perro de san roque no tiene rabo"
    - Display results formatted as specified
    - _Requirements: 1.7_

  - [x] 3.3 Add pseudocode comments to the implementation


    - Document algorithm steps in comments
    - Explain word parsing and vowel counting logic
    - _Requirements: 1.4_

  - [x] 3.4 Write unit tests for Exercise 2


    - Test with provided example text
    - Test with empty string
    - Test with text containing no vowels
    - Test with uppercase and lowercase vowels
    - Test with single word
    - Verify word count accuracy
    - _Requirements: 1.7_


- [x] 4. Create Database E/R Model



  - [ ] 4.1 Design and document Entity-Relationship diagram

    - Create ER-Model.md or diagram file with all entities
    - Define Usuario, CuentaBancaria, Banco, Inversion, Cuestionario, Blog entities
    - Document all relationships and cardinalities


    - Include primary and foreign keys
    - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8_


  - [ ] 4.2 Create SQL schema script
    - Write CREATE TABLE statements for all entities


    - Define constraints, primary keys, and foreign keys
    - Include appropriate data types
    - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8_

- [x] 5. Implement SQL Queries



  - [ ] 5.1 Write Query 2 - List bank accounts ordered by last name

    - Implement SELECT with DISTINCT
    - Join Usuario, CuentaBancaria, and Banco tables


    - Order by apellidos
    - _Requirements: 3.1, 3.4_

  - [ ] 5.2 Write Query 3 - Increase interest rate for loyal investors



    - Implement UPDATE statement
    - Calculate 2+ years using DATEDIFF
    - Increase tasa_interes by 2%
    - _Requirements: 3.2, 3.4_



  - [ ] 5.3 Write Query 4 - Count clients per bank

    - Implement SELECT with COUNT and GROUP BY


    - Join Banco, CuentaBancaria, and Usuario tables
    - Use DISTINCT to avoid duplicate client counts


    - _Requirements: 3.3, 3.4_

  - [ ] 5.4 Create queries.sql file with all SQL statements

    - Organize queries with comments
    - Include sample data inserts for testing


    - _Requirements: 3.1, 3.2, 3.3, 3.4_

  - [ ] 5.5 Create test data and verify SQL queries
    - Insert sample data for all tables


    - Execute Query 2 and verify results are ordered correctly
    - Execute Query 3 and verify interest rate increases
    - Execute Query 4 and verify client counts per bank
    - _Requirements: 3.1, 3.2, 3.3, 3.4_

- [ ] 6. Answer Web Technologies Questionnaire

  - [ ] 6.1 Create answers.md with theoretical explanations

    - Explain what HTML is and its purpose
    - Explain what JavaScript is and its role
    - Explain what CSS is and its function
    - Explain what Bootstrap is and its benefits
    - _Requirements: 4.1_

  - [ ] 6.2 Explain and document MVC pattern

    - Provide clear explanation of Model-View-Controller
    - Describe each component's responsibility
    - _Requirements: 4.2_

  - [ ] 6.3 Explain and document REST architecture
    - Provide clear explanation of REST principles
    - Describe HTTP methods and status codes
    - _Requirements: 4.3_

- [ ] 7. Create MVC Example Implementation

  - [ ] 7.1 Create ASP.NET Core MVC project structure

    - Set up Controllers, Models, and Views folders
    - Configure routing and services
    - _Requirements: 4.2, 4.4, 4.5_

  - [ ] 7.2 Implement Model classes

    - Create data model classes (e.g., Product, User)
    - Add data annotations for validation
    - _Requirements: 4.2, 4.5_

  - [ ] 7.3 Implement Controller with actions

    - Create controller with Index, Details, Create actions
    - Handle GET and POST requests
    - Pass data to views
    - _Requirements: 4.2, 4.5_

  - [ ] 7.4 Create Razor Views

    - Implement Index view to list items
    - Implement Details view to show single item
    - Implement Create view with form
    - _Requirements: 4.2, 4.5_

  - [ ] 7.5 Test MVC application functionality
    - Verify routing works correctly
    - Test form submission and data binding
    - Verify views render properly
    - Test navigation between views
    - _Requirements: 4.2, 4.5_

- [ ] 8. Create REST API Example Implementation

  - [ ] 8.1 Create ASP.NET Core Web API project

    - Set up API controllers
    - Configure JSON serialization
    - _Requirements: 4.3, 4.4, 4.5_

  - [ ] 8.2 Implement REST API endpoints

    - Create GET endpoint to retrieve resources
    - Create POST endpoint to create resources
    - Create PUT endpoint to update resources
    - Create DELETE endpoint to remove resources
    - _Requirements: 4.3, 4.5_

  - [ ] 8.3 Implement proper HTTP status codes

    - Return 200 OK for successful GET
    - Return 201 Created for successful POST
    - Return 404 Not Found for missing resources
    - Return 400 Bad Request for validation errors
    - _Requirements: 4.3, 4.5_

  - [ ] 8.4 Add API documentation comments

    - Document each endpoint's purpose
    - Describe request/response formats
    - _Requirements: 4.3, 4.5_

  - [ ] 8.5 Test REST API endpoints
    - Test GET endpoint returns correct data
    - Test POST endpoint creates resources
    - Test PUT endpoint updates resources
    - Test DELETE endpoint removes resources
    - Verify proper HTTP status codes are returned
    - Test error handling scenarios
    - _Requirements: 4.3, 4.5_

- [ ] 9. Final documentation and testing

  - [ ] 9.1 Update main README.md

    - Add overview of all completed components
    - Include instructions to run each exercise
    - Document how to test SQL queries
    - Provide links to MVC and REST examples
    - _Requirements: 1.1, 2.1, 3.1, 4.1_

  - [ ] 9.2 Add individual README files for each component

    - Create README for ProgrammingExercises with run instructions
    - Create README for DatabaseDesign explaining the model
    - Create README for WebQuestionnaire with example instructions
    - _Requirements: 1.1, 2.1, 3.1, 4.1_

  - [ ] 9.3 Verify all solutions against requirements
    - Test Exercise 1 with provided example
    - Test Exercise 2 with provided example
    - Validate E/R model covers all entities
    - Test all SQL queries
    - Verify MVC and REST examples run correctly
    - _Requirements: 1.6, 1.7, 2.8, 3.1, 3.2, 3.3, 4.5_
