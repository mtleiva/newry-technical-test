# Requirements Document

## Introduction

This document outlines the requirements for completing the Newry technical test, which consists of three main components: a programming exercise (choice between two algorithms), a practical case involving an E/R model and SQL queries for a financial investment application, and a web technologies questionnaire with practical examples.

## Requirements

### Requirement 1: Programming Exercise

**User Story:** As a developer completing the technical test, I want to implement one of two algorithmic solutions in C#, so that I can demonstrate my programming skills and problem-solving abilities.

#### Acceptance Criteria

1. WHEN the developer chooses Exercise 1 THEN the system SHALL implement an algorithm that separates even and odd numbers from an input list
2. WHEN the developer chooses Exercise 2 THEN the system SHALL implement an algorithm that counts vowel occurrences and words containing each vowel
3. WHEN implementing either exercise THEN the solution SHALL be written in C#, Java, or C++
4. WHEN the solution is complete THEN it SHALL include pseudocode comments explaining the approach
5. WHEN Exercise 1 is implemented THEN zero SHALL be considered an even number
6. WHEN Exercise 1 receives input {4,6,9,1,0,4,3,2,5,8,3,7} THEN it SHALL return ListaPares: {4,6,0,4,2,8} and ListaImpares: {9,1,3,5,3,7}
7. WHEN Exercise 2 receives "El perro de san roque no tiene rabo" THEN it SHALL return the correct count of vowels and words containing each vowel

### Requirement 2: Database Design - E/R Model

**User Story:** As a database designer, I want to create an Entity-Relationship model for the Dynamics Financial investment application, so that the system can properly store user data, financial accounts, investments, and blog content.

#### Acceptance Criteria

1. WHEN designing the database THEN the system SHALL support user registration with personal and financial data
2. WHEN a user registers THEN the system SHALL allow multiple bank accounts per user
3. WHEN storing account information THEN the system SHALL include account holders, account numbers, and bank information
4. WHEN users complete registration THEN the system SHALL store risk assessment questionnaire results
5. WHEN managing investments THEN the system SHALL track investment amount, interest generated, and interest rate applied
6. WHEN Dynamics Financial updates data THEN the system SHALL support storage of current financial data
7. WHEN managing content THEN the system SHALL support a blog with posts created by Dynamics Financial
8. WHEN viewing investments THEN users SHALL be able to see all their investments with interest details

### Requirement 3: SQL Query Implementation

**User Story:** As a database developer, I want to implement specific SQL queries for business requirements, so that Dynamics Financial can retrieve and manipulate data according to their needs.

#### Acceptance Criteria

1. WHEN Query 2 is executed THEN the system SHALL return a list of distinct bank accounts for all users ordered by last name
2. WHEN Query 3 is executed THEN the system SHALL increase the interest rate by 2% for all investors with more than 2 years of tenure
3. WHEN Query 4 is executed THEN the system SHALL return the count of clients grouped by bank
4. WHEN any query is implemented THEN it SHALL use proper SQL syntax and be executable

### Requirement 4: Web Technologies Questionnaire

**User Story:** As a developer completing the technical test, I want to answer theoretical questions about web technologies and provide practical examples, so that I can demonstrate my knowledge of web development concepts.

#### Acceptance Criteria

1. WHEN answering questions THEN the system SHALL provide clear explanations for HTML, JavaScript, CSS, and Bootstrap
2. WHEN explaining MVC THEN the solution SHALL include a practical implementation example
3. WHEN explaining REST THEN the solution SHALL include a practical implementation example
4. WHEN providing examples THEN they SHALL be in a technology of the developer's choice
5. WHEN examples are provided THEN they SHALL be functional and demonstrate understanding of the concepts
