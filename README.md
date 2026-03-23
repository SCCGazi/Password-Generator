Password Generator (Bash)

A lightweight, interactive Bash script that generates random numbers with a fixed digit length—designed for simple password/PIN creation and input validation practice.

About Me

Hi, I’m Gazi Kutbay
I’m building hands-on experience with Linux, Bash scripting, and automation. This project demonstrates my ability to:

Write structured Bash scripts
Validate user input
Use loops, arrays, and conditions
Build interactive CLI tools
Case Study (Problem & Solution)
Problem

Users often need quick, structured random numbers (e.g., PIN codes, test data, temporary passwords). However:

Manual generation is inefficient
Incorrect formats (wrong digit length) cause issues
Many tools lack input validation
Solution

This script solves the problem by:

Enforcing exact digit length
Allowing custom min/max ranges
Generating multiple random values instantly
Providing a user-friendly interactive experience
Features
Fixed digit-length validation
Generate multiple random numbers
Input validation (min/max & digit count)
Repeat generation without restarting
Runs in Bash (no heavy dependencies)
Project Structure
Password-Generator/
│
├── password-generator.sh
├── lib/
│   └── tools.sh
├── README.md
└── LICENSE

No unnecessary files included (clean repo structure)

How to Run (GitHub Codespaces)

This project is fully compatible with GitHub Codespaces.

Steps:
Open the repository on GitHub
Click Code → Codespaces → Create Codespace
Wait for the environment to load
In the terminal, run:
chmod +x password-generator.sh
./password-generator.sh
Follow the prompts

The script runs without errors in Codespaces

Local Usage
chmod +x password-generator.sh
./password-generator.sh
Example
Enter amount of digits: 4
How many random numbers to generate: 3
Min: 1000
Max: 9999

Generated numbers:
1. 4821
2. 7365
3. 1094
Requirements
Bash shell
tools.sh file in lib/ directory (contains getNumber function)
License

This project is licensed under the MIT License.
See the LICENSE file for details.

Attribution

This project was developed with support from:

ChatGPT (for guidance, debugging, and documentation)
Classroom/lab materials and scripting exercises
Summary

This project demonstrates:

Clean repository structure
Functional Bash scripting
Real-world input validation
Professional documentation