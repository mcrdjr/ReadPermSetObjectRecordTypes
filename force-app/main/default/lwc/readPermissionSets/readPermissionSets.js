import { LightningElement , wire} from 'lwc';
import readRecordTypesInPermissionSets from '@salesforce/apex/MetadataMCR.readRecordTypesInPermissionSets';
import getPermSet from '@salesforce/apex/MetadataMCRPermClass.getPermSet';
import { NavigationMixin } from 'lightning/navigation';
import {ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ReadPermissionSets extends NavigationMixin(LightningElement) {

showPermissions;
showPermissionSets;
resultsData;
permissionSetRecords;
permissionSetCount;
selectedPermSet = [];
tempArray = [];
permNames = [];
isLoading;
maxPermissionSetsCount = 0;
sortBy;
sortDirection;

permissionSetColumns = [
    {label: 'Id', fieldName: 'Id', type: 'text'},
    {label: 'Permission Set', fieldName: 'Name', type: 'text', sortable: "true"},
    {label: 'Type', fieldName: 'Type', type: 'text'},
    {label: 'Object/Record Type(s) Found', fieldName: 'PermSet', type: 'text', sortable: "true"}
]

doSorting(event) {
    console.log(JSON.stringify(event));
    this.sortBy = event.detail.fieldName;
    this.sortDirection = event.detail.sortDirection;
    this.sortData(this.sortBy, this.sortDirection);
}

sortData(fieldname, direction) {
    let parseData = JSON.parse(JSON.stringify(this.PermissionSetRecords));
    // Return the value stored in the field
    let keyValue = (a) => {
        return a[fieldname];
    };
    // cheking reverse direction
    let isReverse = direction === 'asc' ? 1: -1;
    // sorting data
    parseData.sort((x, y) => {
        x = keyValue(x) ? keyValue(x) : ''; // handling null values
        y = keyValue(y) ? keyValue(y) : '';
        // sorting values based on direction
        return isReverse * ((x > y) - (y > x));
    });
    this.PermissionSetRecords = parseData;
}    

@wire(getPermSet)
    wiredProcessStrings({ error, data }) {
        if (data) {
            //console.log(data);
            this.permissionSetCount = data.length; //JSON.parse(JSON.stringify(data)).length;

            if (this.permissionSetCount > 0 ) {
                //this.permissionSetCount =  data.records.length;
                //console.log('Count of Permission Sets:' , this.permissionSetCount);
            }

            let tablePermissionSet =  [];
            data.forEach( obj => {
                //console.log(obj);
                let recordObj = {};
                recordObj.Id = obj.Id;
                recordObj.Name = obj.Name;
                recordObj.Type = obj.Type;
                tablePermissionSet.push(recordObj);
            });

            this.PermissionSetRecords = tablePermissionSet;

            this.showPermissionSets = true;
        } else if (error) {
            // Handle error
            console.error('Error processing strings:', JSON.stringify(error));
            this.showPermissionSets = false;
        }
    }


    async handleRetrievePermissions() {
        this.isLoading = true;
        //console.log('perNamesSelected:', this.selectedPermSet);
        this.permNames = this.selectedPermSet;
        console.log('permNames:', this.permNames);
        console.log('permNames length:', this.permNames.length);
        if (this.permNames.length === 0) {
            console.log('Nothing Selected');
            this.isLoading = false;

            const evt = new ShowToastEvent({
                title: 'Nothing Selected',
                message: 'Please select a maximum of 10 Permisions Sets',
                variant: "info"
            });
            this.dispatchEvent(evt);

            return;
        }
        //await readRecordTypesInPermissionSetsQ({ permNames: '$permNames' })
        await readRecordTypesInPermissionSets( {permNames : this.permNames })
        .then(results => {
            this.template.querySelector('lightning-datatable').selectedRows=[];
            if (results.length === 0) {
                console.log('nothing found', results);

                const evt = new ShowToastEvent({
                    title: 'Permission Sets Info',
                    message: 'Permission Set(s) returned no data for Record Type Access',
                    variant: "info"
                });
                this.dispatchEvent(evt);

                return;
            }
            //this.showPermissions = true;
            this.resultsData = results;
            this.tempArray = this.resultsData.map((key) => (
                {
                    label: key, 
                    value: key
                }
            ));

            let tablePermissionSet =  [];
            this.PermissionSetRecords.forEach( row => {

                    let recordObj = {};
                    recordObj.Id = row.Id;
                    recordObj.Name = row.Name;
                    recordObj.Type = row.Type;
                    recordObj.PermSet = row.PermSet;

                    let strObject = [];
                    this.tempArray.forEach( found => {
                        let text = found.label;
                    
                        let strLen = row.Name.length;
                        let result = text.substr(0, strLen);
                        //console.log('str value:', result, row.Name);
                        if (result === row.Name) {
                            //console.log('object.rt found ?...', result, row.Name); 
                            //recordObj.PermSet = 'Found !';   
                            
                            let indices = [];
                            for(let i=0; i<text.length;i++) {
                            if (text[i] === ":") indices.push(i);
                            }
                            //console.log('indices :',indices );
                            //console.log(indices[0], indices[1]);

                            strObject.push( text.substr(indices[0] + 1, (indices[1] - indices[0]) - 1));
                            console.log(strObject);
                            recordObj.PermSet = JSON.stringify(strObject);

                        } else {
                            //recordObj.PermSet = 'Nothing found';    
                        }


                    });

                    tablePermissionSet.push(recordObj);    

                this.PermissionSetRecords = tablePermissionSet;

                this.sortBy = 'PermSet';
                this.sortDirection = 'desc';
                this.sortData(this.sortBy, this.sortDirection);

            });
        }) .catch(error => {
            //this.showPermissions = false;
            console.log('JSON:', error);
            //console.log(error);
            const evt = new ShowToastEvent({
                title: 'Error Retrieving Perm Sets',
                message: 'Error: ' + JSON.stringify(error),
                variant: "error"
            });
            this.dispatchEvent(evt);
        }); 
        this.isLoading = false;
    } 

    handlePermissionSetRowSelection(event){
        const selectedRow = event.detail.selectedRows;
        //console.log('selectedRow.length:' , selectedRow.length);
        if ( selectedRow.length === 0) {
            this.maxPermissionSetsCount = 0;     
        }
        //console.log('count selected:' , this.maxPermissionSetsCount);
        if (this.maxPermissionSetsCount === 9 || selectedRow.length === 10) {
            //this.template.querySelector('lightning-datatable').selectedRows=[];
            const evt = new ShowToastEvent({
                title: 'Max # of Permission Sets have been Selected',
                message: 'You can only select 10 Permissions Set at a time - Salesforce Limit :(',
                variant: "info"
            });
            this.dispatchEvent(evt);
            //this.maxPermissionSetsCount = 0;
            //return;
        }
        this.selectedPermSet = [];
        
        if (selectedRow.length > 0) {
            selectedRow.forEach(row => {
                //console.log('row:' , row.Name);
                this.selectedPermSet.push(row.Name);
            });
            //console.log(this.selectedPermSet);
            this.maxPermissionSetsCount +=1;
        } else {
            this.maxPermissionSetsCount = 0; 
        }
    }
}