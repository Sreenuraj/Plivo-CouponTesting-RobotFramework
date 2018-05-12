# Plivo-CouponTesting-RobotFramework

## Contents
- Tests

        Contain the Testcase Robot file

- Resources
        
        Contains the keyword file and the Pageobjects

- Results
        
        Will populate the result in html format

- requirement.txt
        
        Will have the dependency for the suite to run

## Changing the browser to run
        
        Go to Resources/LocatorsVariables.robot file
        Change the ${BROWSER} value to 'chrome' or 'Firefox'


## Running the test
- Below are the options to run all the tests and we will get the result in the result folder
    
    From the root directory execute:
    robot -d results tests/Plivo-CouponTesting-Positive.robot
    
    If need to change the title of report and log: 
    robot -d results --reporttitle "Give A TITLE" --logtitle "Give A TITLE" tests
    
    If need to get report with timestamp and which helps in not overwriting the report file in the next run
    : robot -d results -T tests/Plivo-CouponTesting-Positive.robot
    
    If need to set the level to debug and run: 
    robot -d results -L debug tests/Plivo-CouponTesting-Positive.robot
    
