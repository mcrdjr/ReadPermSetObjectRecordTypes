//https://salesforce.stackexchange.com/questions/411712/not-able-to-call-metadata-api-service-from-lwc-controller-using-apex-class
global class MetadataMCRSessionIdFormVFPage {
    global static String getSessionIdFromVFPage(PageReference visualforcePage){
        String content = 'Start_Of_Session_Id123456789End_Of_Session_Id';
        if(!Test.isRunningTest()) {
            content = visualforcePage.getContent().toString();
        }
        Integer s = content.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length(),
            e = content.indexOf('End_Of_Session_Id');
        return content.substring(s, e);
    }
}