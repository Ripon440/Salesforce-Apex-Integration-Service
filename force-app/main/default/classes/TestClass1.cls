public with sharing class TestClass1 {

    public static void sendData(){
        String endPoint = 'https://th-apex-http-callout.herokuapp.com/animals';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() != 201){
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug('response ' + response.getBody());
        }
    }
}