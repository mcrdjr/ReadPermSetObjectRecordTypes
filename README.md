<a href="https://githubsfdeploy.herokuapp.com?owner=mcrdjr&repo=ReadPermSetObjectRecordTypes">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
 
# Read Object Record Type Assignments
This repository was born out of need to read Permission Sets (PS) Record Type Assignments for various Objects. At this point (6/2024), SOQL can't do this 100%. You can however use the Metadata service to read thru the PS and find which Objects have Record Type Assignments. Having to look at each PS was tedious. Using this LWC (with Apex) you can select up to 10 PS (Salesforce Limitation) and find all the Objects and the Record Types that have been set.

A Lightning Datable will display the PS and which Objects and Assigned Record Types there are. No data is changed, you would still need to go to PS and uncheck Assigned Record Type.

![What is Looks like](ReadPermissionSet.png)

A Test class is included also. 
![Code Coverage](ReadPermissionSetCodeCoverage.png)

The MetadataMCR class only has parts and pieces to accomodate the Permission Set. The full version of that class is well over 13k lines of code. I bascially took what was needed for PS and butchered it up and renamed some of the files used with *MCR.

Once it is deployed, you can add the LWC to any page.

By the way, I'm sure I copied everything right, and you may also...

## Some things...

Links for features used
- [Get Session Id](https://salesforce.stackexchange.com/questions/411712/not-able-to-call-metadata-api-service-from-lwc-controller-using-apex-class)

Read Permission Set Metadata 
- [Read Permission Set Metadata](https://salesforce.stackexchange.com/questions/362049/pull-record-types-per-permission-set-through-metadata-api)

Deploy to Sales Button 
- [Deploy to Sales Button](https://andyinthecloud.com/2014/09/27/the-new-github-deploy-to-salesforce-tool-button/)

Github Repository for apex-mdapi
- [apex-mdapi](https://github.com/certinia/apex-mdapi)

## As I have time I will add more comments on what all is going on. Some of the LWC and Apex have comments along the way. It's a complicated mess of stuff. Some of the Metadata is hard to wrap my head around.

## Enjoy!

## [Gal 2:20](https://kjvgalatians220.com/)



