Password Generator Script

Author

Gazi Kutbay

Course

Application Development – North Seattle College

Project Overview

This project is a custom-built password and number generator designed to help users create secure, randomized outputs based on their preferences. It provides two main functionalities:

* Generate strong, randomized passwords using mixed character sets
* Generate unique random numbers within a defined range

The script focuses on user input validation, randomness, and flexibility, making it a practical tool for learning scripting concepts and improving security awareness.

Features
Password Generator (Character-Based)

* Generates one or multiple passwords
* Allows user-defined minimum and maximum length
* Includes:

  * Lowercase letters
  * Uppercase letters
  * Digits
  * Special characters
* Ensures each password contains a mix of all character types
* Randomizes character order for stronger security

Random Number Generator

* Generates multiple unique random numbers
* Allows control over:

  * Number of digits
  * Minimum and maximum values
* Prevents duplicate numbers
* Validates all user inputs for correctness

Interactive Experience

* Menu-driven interface
* Clear prompts for user input
* Input validation with error messages
* Option to generate multiple sets without restarting

User Manual
Here is an example

This section explains how to use the application step by step.

Starting the Program

* Launch the script in a Linux environment
* The program will display a menu asking what type of generation you want

Option 1: Character-Based Password Generation

1. When prompted, press **y** to select password generation
2. Enter how many passwords you want to generate
3. Enter the minimum password length
4. Enter the maximum password length
5. The program will validate your inputs:

   * Minimum length must be less than or equal to maximum length
6. The system will generate passwords that:

   * Include letters, numbers, and special characters
   * Are randomized for security
7. Generated passwords will be displayed as a numbered list

Option 2: Random Number Generation

1. When prompted, press **n** to select number generation
2. Enter the number of digits each number should have
3. Enter how many random numbers to generate
4. Enter the minimum value
5. Enter the maximum value
6. The program will validate:

   * Minimum and maximum must have the specified number of digits
   * Minimum must be less than maximum
   * The number of requested values must not exceed the available range
7. The system will generate unique random numbers
8. Results will be displayed as a numbered list

Generate Again or Exit

* After results are displayed, the program will ask:

  * Press **y** to generate another set
  * Press **n** to exit the program

Error Handling

* If invalid input is entered, the program will display an error message
* You will be prompted again until valid input is provided

Project Structure

* Main script file
* External utility functions for input validation
* Organized logic using reusable functions

Example Of Usage The App

How many random numbers to generate:  5

Min:  10000

Max:  10006

Generated numbers:

1. 10002
2. 10000
3. 10001
4. 10006
5. 10005
   
Do you want to generate another set? (y/n): y
-----------------------------------------------------------------
Do you want to generate random passwords with characters?
Press y for yeas and n for no  (y/n):
-----------------------------------------------------------------

How many passwords to generate?  5

Minimum password length:  2

Maximum password length:  7

Generated passwords:
1. 8=rK
2. DW{9-j
3. 1&v]F
4. Q0=x
5. Sdd6W.w
   
Do you want to generate another set? (y/n): n

Goodbye!
  
Skills Demonstrated

* Bash scripting fundamentals
* Function creation and reuse
* User input handling and validation
* Loop structures and conditional logic
* Randomization techniques
* Array usage and data handling

Purpose

This project was developed as part of coursework at North Seattle College to demonstrate practical scripting skills and problem-solving using automation. It highlights how command-line tools can be used to build useful and interactive utilities.

Future Improvements

* Add option to save generated results to a file
* Enhance password strength rules with custom requirements
* Improve user interface with more structured menus
* Add logging for generated outputs

License

This project is for educational purposes.
