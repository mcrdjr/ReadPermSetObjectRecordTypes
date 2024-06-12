@isTest
global class MetadataMCRMockImpl implements WebServiceMock {
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {
            
            if(request instanceof MetadataMCR.readMetadata_element) {
                
                MetadataMCR.readMetadata_element requestReadMetadata_element = (MetadataMCR.readMetadata_element) request;
                
                if (requestReadMetadata_element.type_x == 'PermissionSet') { 
                    String className = 'MetadataMCR.readPermissionSetResponse_element';
                    StaticResource sr = [Select Id, Body from StaticResource where Name = 'MetadataMCRforPermissionSet' LIMIT 1];
                    Type responseTypePS = Type.forName(className);
                    QueuedResponse qr = new QueuedResponse();
                    qr.key = 'response_x';
                    qr.response = JSON.deserialize(sr.Body.toString(), responseTypePS);
                    response.put(qr.key, qr.response);
                }
            }
        }
    
    public class QueuedResponse {
        protected String key;
        protected Object response;
    }
}