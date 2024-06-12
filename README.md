<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

# Read Object Assinged Record Types
This reposioy was born out of need to read Permission Sets (PS) Assigned Record type. At this point (6/2024), SOQL can't do this 100%. You can however use the Metadata service to read thru the PS and find which Object have Assinged Records types. Having to look at each PS was tedious. Using this LWC (with Apex) you can select up to 10 PS (Salesforce Limitation) and find all the Objects and the Record Types that have been set.

A Lightning Datable will display the PS and which Objects and Assigned Record Types there are. No data is changed, you would still need to go to PS and uncheck Assigned Record Type.



## Read All About It

This project uses Metadata Service features
- [Salesforce Metadata Service Documentation](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Metadata_Metadata.htm)

Other Links for features used
- [Get Session Id](https://salesforce.stackexchange.com/questions/411712/not-able-to-call-metadata-api-service-from-lwc-controller-using-apex-class)

Read Permission Set Metadata 
- [Read Permission Set Metadata](https://salesforce.stackexchange.com/questions/362049/pull-record-types-per-permission-set-through-metadata-api)

Deploy to Sales Button 
- [Deploy to Sales Button](https://andyinthecloud.com/2014/09/27/the-new-github-deploy-to-salesforce-tool-button/)

