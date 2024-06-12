//https://github.com/ChuckJonas/vscode-apex-pmd/blob/master/rulesets/apex_ruleset.xml

@isTest()
public class RecordTypeAccessbyProfileTest {

    @isTest
    public static void getProfileAccounts() {
        Test.startTest();
        List<Profile> profileNames = [select Id, Name from Profile order by Name];
        List<User> allUsers = New List<User>();
        
        //TriggerHelperUtility.setStopTrigger();
        
        String uniqueUserName = 'testUser' + DateTime.now().getTime() + '@testOrg.com';
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User testUser = new User(Alias = 'testUs', Email='testUser@test.com.invalid',
                                 EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                                 LocaleSidKey='en_US', ProfileId = p.Id,
                                 TimeZoneSidKey='America/Los_Angeles',
                                 UserName=uniqueUserName, 
                                 Disable_Validation_Flag__c=true, 
                                 Disable_Workflows_Flag__c	= true
                                );
        insert testUser;
        
        System.runAs(testUser){
            
            
            for (Profile pName : profileNames) {
                
                //String username; // = 'testuser@example.com';
                String firstName = 'Test';
                String lastName = 'User';
                String alias = 'testuser';
                //String email; // = 'testuser@example.com';
                Integer IntrandomNumber = Integer.valueof((Math.random() * 100000));
                String uniqueName = pName.Name.deleteWhiteSpace().normalizeSpace().trim().replaceAll(':','') + IntrandomNumber; 
                
                User anyUser = new User(
                    Username = uniqueName +'@uspstest.gov',
                    FirstName = firstName,
                    LastName = lastName,
                    Alias = alias,
                    Email = uniqueName +'@uspstest.gov',
                    ProfileId = pName.Id,
                    TimeZoneSidKey = 'America/Los_Angeles', // Set timezone as per requirement
                    LocaleSidKey = 'en_US', // Set locale as per requirement
                    EmailEncodingKey = 'UTF-8', // Set email encoding as per requirement
                    LanguageLocaleKey = 'en_US', // Set language locale as per requirement
                    //Account_Area__c = 'Atlantic',
                    //Account_District__c = 'Maryland',
                    Disable_Workflows_Flag__c = true,
                    Disable_Validation_Flag__c = true,
                    CommunityNickname = uniqueName
                );
                
                allUsers.add(anyUser);
            }
        }
        
        System.Debug('Size of allUsers:' + allUsers.size());
        
        Set<Id> userIds = New Set<Id>();
        
        Database.SaveResult[] srList = Database.insert(allUsers, false);
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                //System.Debug('User Id inserted:' + sr.getId());
                userIds.add(sr.getId());
            } else {
                for (Database.Error err : sr.getErrors()) {
                    System.Debug('Errors:' + sr + ':' + err);
                }
            }
        }
        
        List<User> userList = New List<User>();
        userList = [Select Id, Name, UserName, Profile.Name from User where Id IN : userIds];
        System.Debug('Count of Users Created from Profiles:' + userList.size());
        For (User u: userList) {
            //System.Debug('User:' + u);
            
            System.RunAs(u) {
                Schema.SObjectType objType = Account.SObjectType;
                List<RecordTypeInfo> infos = objType.getDescribe().getRecordTypeInfos();
                for (RecordTypeInfo i : infos) {
                    if (i.getName().contains('MSSC') &&  i.isAvailable()) {
                        System.Debug(u.Profile.Name + ':' + i.getName() + ':isActive:' + i.isActive() + ':isAvailable:' + i.isAvailable());
                    }
                }
                objType = Contact.SObjectType;
                infos = objType.getDescribe().getRecordTypeInfos();
                for (RecordTypeInfo i : infos) {
                    if (i.getName().contains('MSSC') &&  i.isAvailable()) {
                        System.Debug(u.Profile.Name + ':' + i.getName() + ':isActive:' + i.isActive() + ':isAvailable:' + i.isAvailable());
                    }
                }
            }
            
        }
        
        //TriggerHelperUtility.clearStopTrigger();
        Test.stopTest();
    }

}