import { LightningElement, api, wire } from 'lwc';  
import fetchRecords from '@salesforce/apex/RelatedListController.fetchRecords';  
  
export default class RelatedList extends LightningElement {  
  
    
    // variables linked to xml file
    @api recordId;
    @api apiNameOfObject;
    @api relation;
    @api fieldsToFetch;
    @api validation;

    showSpinner=true;

    //method to get them all combined to string
    get vals() {  
        return this.recordId + '/' + this.apiNameOfObject + '/' +   
               this.relation + '/' + this.fieldsToFetch + '/' +   
               this.validation;
    }  
 
    records;
    @wire(fetchRecords, { listValues: '$vals' })
    wiredAccount({ error, data }) {
        if (data) {
           this.records = data;
            this.error = undefined;
            this.showSpinner=false;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }

  
}  