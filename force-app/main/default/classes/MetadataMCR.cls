/*
 * 
Usage:
List<String> perms = new List<String>{'API_NAME_OF_PERM_SET'};
List<String> permsfound = MetadataMCR.readRecordTypesInPermissionSets(perms);
System.Debug(permsFound);
*
*/

public class MetadataMCR {
    
    public virtual class Metadata {
        public String fullName;
    }
    
    public class Profile extends Metadata {
        public String type = 'Profile';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
            private String[] applicationVisibilities_type_info = new String[]{'applicationVisibilities','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};   
                private String[] fieldPermissions_type_info = new String[]{'fieldPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                    }
    
    public class ReadPermissionSetResult implements IReadResult {
        public MetadataMCR.PermissionSet[] records;
        public MetadataMCR.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'records'};
                    }
    
    public class readPermissionSetResponse_element implements IReadResponseElement {
        public MetadataMCR.ReadPermissionSetResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    
    public class PermissionSetRecordTypeVisibility {
        public String recordType;
        public Boolean visible;
        private String[] recordType_type_info = new String[]{'recordType','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] visible_type_info = new String[]{'visible','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'recordType','visible'};
                        }
    
    public class PermissionSetApplicationVisibility {
        public String application;
        public Boolean visible;
        private String[] application_type_info = new String[]{'application','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] visible_type_info = new String[]{'visible','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'application','visible'};
                        }
    
    public class PermissionSetApexClassAccess {
        public String apexClass;
        public Boolean enabled;
        private String[] apexClass_type_info = new String[]{'apexClass','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'apexClass','enabled'};
                        }
    
    public class PermissionSetCustomPermissions {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'enabled','name'};
                        }
    
    public class PermissionSetExternalDataSourceAccess {
        public Boolean enabled;
        public String externalDataSource;
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] externalDataSource_type_info = new String[]{'externalDataSource','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'enabled','externalDataSource'};
                        }
    
    public class PermissionSetFieldPermissions {
        public Boolean editable;
        public String field;
        public Boolean readable;
        private String[] editable_type_info = new String[]{'editable','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] readable_type_info = new String[]{'readable','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
                    private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                        private String[] field_order_type_info = new String[]{'editable','field','readable'};
                            }
    
    public class PermissionSetObjectPermissions {
        public Boolean allowCreate;
        public Boolean allowDelete;
        public Boolean allowEdit;
        public Boolean allowRead;
        public Boolean modifyAllRecords;
        public String object_x;
        public Boolean viewAllRecords;
        private String[] allowCreate_type_info = new String[]{'allowCreate','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] allowDelete_type_info = new String[]{'allowDelete','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] allowEdit_type_info = new String[]{'allowEdit','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                    private String[] allowRead_type_info = new String[]{'allowRead','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                        private String[] modifyAllRecords_type_info = new String[]{'modifyAllRecords','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                            private String[] object_x_type_info = new String[]{'object','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                                private String[] viewAllRecords_type_info = new String[]{'viewAllRecords','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                                    private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                                        private String[] field_order_type_info = new String[]{'allowCreate','allowDelete','allowEdit','allowRead','modifyAllRecords','object_x','viewAllRecords'};
                                            }
    
    public class PermissionSetApexPageAccess {
        public String apexPage;
        public Boolean enabled;
        private String[] apexPage_type_info = new String[]{'apexPage','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'apexPage','enabled'};
                        }
    
    public class PermissionSetTabSetting {
        public String tab;
        public String visibility;
        private String[] tab_type_info = new String[]{'tab','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] visibility_type_info = new String[]{'visibility','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'tab','visibility'};
                        }
    
    public class PermissionSetUserPermission {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'enabled','name'};
                        }
    
    public class PermissionSet extends Metadata {
        public String type = 'PermissionSet';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
            public MetadataMCR.PermissionSetApplicationVisibility[] applicationVisibilities;
        public MetadataMCR.PermissionSetApexClassAccess[] classAccesses;
        public MetadataMCR.PermissionSetCustomPermissions[] customPermissions;
        public String description;
        public MetadataMCR.PermissionSetExternalDataSourceAccess[] externalDataSourceAccesses;
        public MetadataMCR.PermissionSetFieldPermissions[] fieldPermissions;
        public Boolean hasActivationRequired;
        public String label;
        public String license;
        public MetadataMCR.PermissionSetObjectPermissions[] objectPermissions;
        public MetadataMCR.PermissionSetApexPageAccess[] pageAccesses;
        public MetadataMCR.PermissionSetRecordTypeVisibility[] recordTypeVisibilities;
        public MetadataMCR.PermissionSetTabSetting[] tabSettings;
        public MetadataMCR.PermissionSetUserPermission[] userPermissions;
        private String[] applicationVisibilities_type_info = new String[]{'applicationVisibilities','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
            private String[] classAccesses_type_info = new String[]{'classAccesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                private String[] customPermissions_type_info = new String[]{'customPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                    private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
                        private String[] externalDataSourceAccesses_type_info = new String[]{'externalDataSourceAccesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                            private String[] fieldPermissions_type_info = new String[]{'fieldPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                                private String[] hasActivationRequired_type_info = new String[]{'hasActivationRequired','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
                                    private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                                        private String[] license_type_info = new String[]{'license','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
                                            private String[] objectPermissions_type_info = new String[]{'objectPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                                                private String[] pageAccesses_type_info = new String[]{'pageAccesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                                                    private String[] recordTypeVisibilities_type_info = new String[]{'recordTypeVisibilities','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                                                        private String[] tabSettings_type_info = new String[]{'tabSettings','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                                                            private String[] userPermissions_type_info = new String[]{'userPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                                                                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                                                                    private String[] type_att_info = new String[]{'xsi:type'};
                                                                        private String[] field_order_type_info = new String[]{'fullName', 'applicationVisibilities','classAccesses','customPermissions','description','externalDataSourceAccesses','fieldPermissions','hasActivationRequired','label','license','objectPermissions','pageAccesses','recordTypeVisibilities','tabSettings','userPermissions'};
                                                                            }
    
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'sessionId'};
                    }
    
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'client'};
                    }
    
    public interface IReadResponseElement {
        IReadResult getResult();
    }
    
    public interface IReadResult {
        MetadataMCR.Metadata[] getRecords();
    }
    
    public class readMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] fullNames_type_info = new String[]{'fullNames','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'type_x','fullNames'};
                        }
    
    public class MetadataPort {
        public String endpoint_x = Url.getOrgDomainURL().toExternalForm() + '/services/Soap/m/60.0';  //URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/58.0';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public MetadataMCR.SessionHeader_element SessionHeader;
        public MetadataMCR.DebuggingInfo_element DebuggingInfo;
        public MetadataMCR.DebuggingHeader_element DebuggingHeader;
        public MetadataMCR.CallOptions_element CallOptions;
        public MetadataMCR.AllOrNoneHeader_element AllOrNoneHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/2006/04/metadata';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/2006/04/metadata';
        private String AllOrNoneHeader_hns = 'AllOrNoneHeader=http://soap.sforce.com/2006/04/metadata';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata', 'MetadataMCR'};
            
            public MetadataMCR.IReadResult readMetadata(String type_x,String[] fullNames) {
                MetadataMCR.readMetadata_element request_x = new MetadataMCR.readMetadata_element();
                request_x.type_x = type_x;
                request_x.fullNames = fullNames;
                MetadataMCR.IReadResponseElement response_x;
                Map<String, MetadataMCR.IReadResponseElement> response_map_x = new Map<String, MetadataMCR.IReadResponseElement>();
                response_map_x.put('response_x', response_x);
                WebServiceCallout.invoke(
                    this,
                    request_x,
                    response_map_x,
                    new String[]{endpoint_x,
                        '',
                        'http://soap.sforce.com/2006/04/metadata',
                        'readMetadata',
                        'http://soap.sforce.com/2006/04/metadata',
                        'readMetadataResponse',
                        'MetadataMCR.read' + type_x + 'Response_element'}
                );
                response_x = response_map_x.get('response_x');
                for (String key : response_map_x.keySet()) {
                    MetadataMCR.IReadResponseElement value = response_map_x.get(key);
                    //System.Debug(JSON.serialize(value));
                }
                return response_x.getResult();
            }
    }
    
    public class createMetadata_element {
        public MetadataMCR.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'metadata'};
                    }
    
    public class createMetadataResponse_element {
        public MetadataMCR.SaveResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    
    public class SaveResult {
        public MetadataMCR.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] errors_type_info = new String[]{'errors','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
            private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] success_type_info = new String[]{'success','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                    private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                        private String[] field_order_type_info = new String[]{'errors','fullName','success'};
                            }
    
    public class Error {
        public MetadataMCR.ExtendedErrorDetails[] extendedErrorDetails;
        public String[] fields;
        public String message;
        public String statusCode;
        private String[] extendedErrorDetails_type_info = new String[]{'extendedErrorDetails','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
            private String[] fields_type_info = new String[]{'fields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
                private String[] message_type_info = new String[]{'message','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                    private String[] statusCode_type_info = new String[]{'statusCode','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                            private String[] field_order_type_info = new String[]{'extendedErrorDetails','fields','message','statusCode'};
                                }
    
    public class ExtendedErrorDetails {
        public String extendedErrorCode;
        private String[] extendedErrorCode_type_info = new String[]{'extendedErrorCode','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'extendedErrorCode'};
                    }

    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'debugLog'};
                    }
    
    public class DebuggingHeader_element {
        public MetadataMCR.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
            private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'categories','debugLevel'};
                        }
    
    public class AllOrNoneHeader_element {
        public Boolean allOrNone;
        private String[] allOrNone_type_info = new String[]{'allOrNone','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                private String[] field_order_type_info = new String[]{'allOrNone'};
                    }
    
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
            private String[] level_type_info = new String[]{'level','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
                private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
                    private String[] field_order_type_info = new String[]{'category','level'};
                        }
    
    @AuraEnabled(cacheable=true)  
    public static List<String> readRecordTypesInPermissionSets(List<String> permNames) {
        System.Debug('perNames:' + permNames);
        //System.Debug('UserInfo.getSessionId():' + UserInfo.getSessionId());
        //System.Debug('UserInfo.getSessionId():' + UserInfo.getSessionId().substring(15).toString() + '');
		//System.debug('Org and Session' + UserInfo.getOrganizationId().substring(0, 15) + ' ' + UserInfo.getSessionId().substring(15));
        String sessionId = UserInfo.getSessionId();
        //MetadataMCR.makeMetadataCallout(sessionId);
        
        
        List<String> blank = new List<String>{''};
        if (permNames == blank || permNames.isEmpty()) {
            return null;
        }
        List<String> permsFound = new List<String>();
        
        MetadataMCR.MetadataPort service = new MetadataMCR.MetadataPort();
        service.SessionHeader = new MetadataMCR.SessionHeader_element();
        //https://salesforce.stackexchange.com/questions/110515/getting-session-id-in-lightning
        if (!Test.isRunningTest()) {
            service.SessionHeader.sessionId = MetadataMCRSessionIdFormVFPage.getSessionIdFromVFPage(Page.MetadataMCRSessionId);
        } else {
            service.SessionHeader.sessionId = sessionId; //UserInfo.getSessionId().substring(15).toString() + '';
        }
        
        service.CallOptions = new MetadataMCR.CallOptions_element();
        service.timeout_x = 120000;
        
        System.Debug('service:' + service);
        List<MetadataMCR.PermissionSet> permissionSets;
        //try {
            permissionSets = (List<MetadataMCR.PermissionSet>) service.readMetadata('PermissionSet', permNames).getRecords();
            
            if (permissionSets != null){ 
                for (MetadataMCR.PermissionSet permissionSet_i : permissionSets) {
                    try {
                        if (permissionSet_i?.fullName !=null) {
                            if (permissionSet_i.recordTypeVisibilities != null) {
                                for (MetadataMCR.PermissionSetRecordTypeVisibility recordType_i : permissionSet_i.recordTypeVisibilities) {
                                    System.debug(permissionSet_i?.fullName + ':' + recordType_i?.recordType + ' is visible: ' + recordType_i?.visible);
                                    permsFound.add(permissionSet_i?.fullName + ':' + recordType_i?.recordType + ' is visible: ' + recordType_i?.visible);
                                }
                            } //else {
                              //  System.Debug('Problem getting Individual Permission recordTypeVisibilities on Perm:' + permissionSet_i?.fullName);  
                              //}
                        }
                    } catch (Exception e) {
                        System.Debug('Problem getting Individual Permission Info:' + e);   
                    }
                }
            }
        //} catch (Exception e) {
        //    System.Debug('No Permission Sets Found');
        //}
        System.Debug('permsFound:' + permsFound);
        return permsFound;
    }
}