public class MetadataMCRPermClass {
    @AuraEnabled(cacheable=true) 
    public static List<PermissionSet> getPermSet () {
        List<PermissionSet> psList = new List<PermissionSet>(); 
        psList = [SELECT Id, 
                  Name, 
                  Description, 
                  Type 
                  FROM PermissionSet
                  WHERE Type in ('Regular','Standard','Session')
                  ORDER BY Name];
        return psList;
    }
}