@isTest
public class MetadataMCRTest {
    
    @IsTest
    private static void permissionSetTest()
    {	
        List<String> permsFound;
        Test.setMock(WebServiceMock.class, new MetadataMCRMockImpl());
        Test.startTest();   
        
        new MetadataMCR();
        new MetadataMCR.Profile();
        new MetadataMCR.PermissionSetApexClassAccess();
        new MetadataMCR.CallOptions_element();
        new MetadataMCR.PermissionSet();
        new MetadataMCR.PermissionSetObjectPermissions();
        new MetadataMCR.SessionHeader_element();
        new MetadataMCR.PermissionSetApexPageAccess();
        new MetadataMCR.PermissionSetFieldPermissions();
        new MetadataMCR.PermissionSetUserPermission();
        new MetadataMCR.PermissionSetExternalDataSourceAccess();
        new MetadataMCR.PermissionSetTabSetting();
        new MetadataMCR.PermissionSetApplicationVisibility();
        new MetadataMCR.Error();
        new MetadataMCR.ExtendedErrorDetails();
        new MetadataMCR.SaveResult();
        new MetadataMCR.PermissionSetRecordTypeVisibility();
        new MetadataMCR.createMetadataResponse_element();
        new MetadataMCR.createMetadata_element();
        new MetadataMCR.readMetadata_element();
        new MetadataMCR.ReadPermissionSetResult();
        new MetadataMCR.readPermissionSetResponse_element();
        new MetadataMCR.PermissionSetCustomPermissions();
        new MetadataMCR.DebuggingInfo_element();
        new MetadataMCR.DebuggingHeader_element();
        new MetadataMCR.AllOrNoneHeader_element();
        new MetadataMCR.LogInfo();
        
        try {
            permsFound = MetadataMCR.readRecordTypesInPermissionSets(new List<String>{'MSSC','AC_HPA_Manager'});
        } catch (Exception e) {
            System.Debug('Error:' + e);
        }
        Test.stopTest();
        System.Debug('permFound:' + permsFound);
        System.Assert(permsFound.contains('MSSC:Account.MSSC is visible: true'), ' Should have found an MSSC permission');
    }
    
    @IsTest
    private static void permissionSetUtilsTest()
    {	    
        Test.startTest();   
        String sessionId = MetadataMCRSessionIdFormVFPage.getSessionIdFromVFPage(Page.MetadataMCRSessionId);
        Test.stopTest();
        System.Debug('sessionId:' + sessionId);
        System.Assert(sessionId.contains('123456789'), ' Found Test Session Id');
    }
    
    @IsTest
    private static void permissionSetNoneTest()
    {	    
        List<String> permsNotFound= null;
        Test.setMock(WebServiceMock.class, new MetadataMCRMockImpl());
        Test.startTest();   
        List<String> permsFound = MetadataMCR.readRecordTypesInPermissionSets(new List<String>{''});
        Test.stopTest();
        System.Debug('permFound:' + permsFound + ':' + permsNotFound);
        System.assertEquals(permsFound, permsNotFound, ' No Perms Found');
    }
    
    @IsTest
    private static void permissionSetPermClassTest()
    {	    
        Test.startTest();  
        List<PermissionSet> psList = new List<PermissionSet>(); 
        psList = MetadataMCRPermClass.getPermSet();
        Test.stopTest();
        System.Debug('Perm Sets Retrieved:' + pslist.size());
        System.Assert( pslist.size() > 0 , ' Found Permission Sets');
    }
    
}