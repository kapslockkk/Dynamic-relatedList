public class RelatedListController {  
  
    @AuraEnabled( cacheable=true )  
    public static List < sObject > fetchRecords( String listValues )  {  
      
        system.debug( 'values are ' + listValues );  
        List < String > strList = listValues.split( '/' );  
        system.debug( 'values are ' + strList );  
        String strSOQL;
        
        if(strList.size() == 5 || strList.size() == 4)
        {
          
        String recordId = strList.get( 0 );  
        String apiNameOfObject = strList.get( 1 );  
        String relation = strList.get( 2 );  
        String fieldsToFetch = strList.get( 3 ); 
            
            
            
         if (strList.size() == 5 && strList.get( 4 )==null) {  
        
         String validation = strList.get( 4 );  
  
         strSOQL = 'SELECT '+ fieldsToFetch +' FROM ' + apiNameOfObject + ' WHERE ' + relation + ' =\''  + recordId +'\''+' and '+validation; 

    	} 
        else
        {
            strSOQL = 'SELECT '+ fieldsToFetch +' FROM ' + apiNameOfObject + ' WHERE ' + relation + ' =\''  + recordId +'\'';
        }
        System.debug(strSOQL);
		return Database.query(strSOQL); 
        }
        else
            return null;
          
}  
}
