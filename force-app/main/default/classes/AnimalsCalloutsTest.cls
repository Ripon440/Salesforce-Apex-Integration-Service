@isTest
public class AnimalsCalloutsTest {
    @isTest static void testGetCallout(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = AnimalsCallouts.makeGetCallout();
        System.assertNotEquals(null, response, 'The callout returned a null response.');
        System.assertEquals(200, response.getStatusCode(), 'The status code is not 200.');
        System.assertEquals('application/json;charset=UTF-8',response.getHeader('Content-Type'),
          'The content type value is not expected.'); 
        AnimalClass results = (AnimalClass) JSON.deserialize(response.getBody(), AnimalClass.class);
        System.assertEquals(3, results.animals?.size(), 'The array should only contain 3 items.');
    }

    @isTest static void testPostCallout(){
      // Set mock callout class
      Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());

      HttpResponse response = AnimalsCallouts.makePostCallout();
      // Verify that the response received contains fake values
      String contentType = response.getHeader('Content-Type');
      System.assert(contentType == 'application/json');
      String actualValue = response.getBody();
      System.debug(response.getBody());
      String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
      System.assertEquals(expectedValue, actualValue);
      System.assertEquals(200, response.getStatusCode());
    }
}