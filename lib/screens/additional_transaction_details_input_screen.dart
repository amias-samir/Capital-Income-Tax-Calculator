import 'package:flutter/material.dart';
import 'package:flutter_tax_calculator_app/models/current_fiscal_year_transaction_details_model.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

class AdditionalTransactionDetailsInputScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdditionalTransactionDetailsInputState();
  }

}

class AdditionalTransactionDetailsInputState extends State<AdditionalTransactionDetailsInputScreen>{
  static const int KEY_TRANSACTION_PROCESS = 1;
static const int KEY_TRANSACTION_TYPE = 2;
static const int KEY_OWNERSHIP_TRANSACTION_PROCESS = 3;
static const int KEY_OWNERSHIP_TRANSACTION_TYPE = 4;

static var _transactionProcess = ['Process 1', 'Process 2', 'Process 3', 'Process 4', 'Process 5', 'Process 6'];
static var _transactionType = ['Type 1', 'Type 2', 'Type 3', 'Type 4', 'Type 5', 'Type 6'];
static var _transactionTypeOwnership = ['Type 1 Ownership', 'Type 2 Ownership', 'Type 3 Ownership', 'Type 4 Ownership', 'Type 5 Ownership', 'Type 6 Ownership'];

CurrentFiscalYearTransactionDetails taxRateDetails = CurrentFiscalYearTransactionDetails();
String appBarTitle;

DateTime selectedDate = DateTime.now();

TextEditingController transactionProcessController = TextEditingController();
TextEditingController transactionTypeController = TextEditingController();
TextEditingController transactionProcessOwnershipController = TextEditingController();
TextEditingController thailiAankaWithGharController = TextEditingController();
TextEditingController thailiAankaOwnershipController = TextEditingController();
TextEditingController transactionDateController = TextEditingController();
TextEditingController extraExpensesController = TextEditingController();


@override
Widget build(BuildContext context) {

  TextStyle textStyle = Theme.of(context).textTheme.title;
  TextStyle subTextStyle = Theme.of(context).textTheme.body1;

  thailiAankaWithGharController.text = taxRateDetails.thaili_aanka;
  thailiAankaOwnershipController.text = taxRateDetails.thaili_aanka_ownership;
  transactionDateController.text = "${selectedDate.toLocal()}";
  extraExpensesController.text = taxRateDetails.extre_expenses;



  return WillPopScope(child: Scaffold(
    appBar: AppBar(
      title: new Text("पचालु आर्थिक वर्षभित्र जग्गाधनीले मुलुकभित्र गरेका अन्य बिक्री कारोबार"),
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
        moveToLastScreen();
      }),
    ),
    body: Padding(padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[

            Text('चालु आर्थिक वर्षभित्र जग्गाधनीले मुलुकभित्र गरेका अन्य बिक्री कारोबार', style: textStyle,),

            Padding(padding: EdgeInsets.only(top: 32.0)),
            Text('बिक्री गर्दाको कारोबार विवरण', style: textStyle,),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            // transaction process
            ListTile(
              title: new Text('प्रक्रिया*',),
              subtitle: DropdownButton(
                  items: _transactionProcess.map((String dropDownStringItem) {
                    return DropdownMenuItem<String> (
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem, style: subTextStyle,  ),
                    );
                  }).toList(),

//                style: textStyle,

                  value: getFutureTransactionProcessAsString(taxRateDetails.transaction_process, _transactionProcess),

                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      updateFutureTransactionProcessAsInt(valueSelectedByUser, _transactionProcess, KEY_TRANSACTION_PROCESS);
                    });
                  }
              ),
            ),

            // transaction type element
            ListTile(
              title: new Text('कारोबार किसिम', ),
              subtitle: DropdownButton(
                  items: _transactionType.map((String dropDownStringItem) {
                    return DropdownMenuItem<String> (
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem, style:  subTextStyle,),
                    );
                  }).toList(),

//                style: textStyle,

                  value: getFutureTransactionProcessAsString(taxRateDetails.transaction_type, _transactionType),

                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      updateFutureTransactionProcessAsInt(valueSelectedByUser, _transactionType, KEY_TRANSACTION_TYPE);
                    });
                  }
              ),
            ),

            // Thaili aanka Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: thailiAankaWithGharController,
                style: subTextStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  taxRateDetails.thaili_aanka = thailiAankaWithGharController.text;
                },
                decoration: InputDecoration(
                    labelText: 'थैली अंक(घर लगायत अन्य खर्च सहित*',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 32.0)),


            Text('स्वामित्व कायम हुदाको कारोबार विवरण', style: textStyle,),

            Padding(padding: EdgeInsets.only(top: 10.0)),

            // transaction type element
            ListTile(
              title: new Text('कारोबार किसिम',  ),
              subtitle: DropdownButton(
                  items: _transactionTypeOwnership.map((String dropDownStringItem) {
                    return DropdownMenuItem<String> (
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem, style: subTextStyle , ),
                    );
                  }).toList(),

//                style: textStyle,

                  value: getFutureTransactionProcessAsString(taxRateDetails.transaction_type_ownership, _transactionTypeOwnership),

                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      updateFutureTransactionProcessAsInt(valueSelectedByUser, _transactionTypeOwnership, KEY_OWNERSHIP_TRANSACTION_TYPE);
                    });
                  }
              ),
            ),

            // Thaili aanka Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: thailiAankaOwnershipController,
                style: subTextStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  taxRateDetails.thaili_aanka_ownership = thailiAankaOwnershipController.text;
                },
                decoration: InputDecoration(
                    labelText: 'थैली अंक',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

//          transaction date
            Padding(
              padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
              child: TextField(
                controller: transactionDateController,
                style: subTextStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
//                taxRateDetails.transaction_date = DateTime.parse(transactionDateController.text);
                  taxRateDetails.transaction_date = DateTime.parse(formatDate((DateTime.parse(transactionDateController.text)), [yyyy, '-', mm, '-', dd]));

                },
                decoration: InputDecoration(
                    labelText: 'कारोबार मिति',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    suffix: IconButton(icon: Icon(Icons.date_range), onPressed: (){
                      _selectDate(context);
                    })
                ),
              ),
            ),

            // extra expenses
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: thailiAankaOwnershipController,
                style: subTextStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  taxRateDetails.thaili_aanka_ownership = thailiAankaOwnershipController.text;
                },
                decoration: InputDecoration(
                    labelText: 'अन्य खर्च',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

          ],
        )),
  ), onWillPop: (){
    moveToLastScreen();
  });
}



String getFutureTransactionProcessAsString(int value, var futureTransaction) {
  print("getPriorityAsString " + value.toString());
  if(value != null){
    return futureTransaction[value-1];
  }
}

void updateFutureTransactionProcessAsInt(String value, var futureTransaction, int type) {

  switch(type){
    case KEY_TRANSACTION_PROCESS :
      taxRateDetails.transaction_process = futureTransaction.indexOf(value) + 1;
      break;

    case KEY_TRANSACTION_TYPE :
      taxRateDetails.transaction_type = futureTransaction.indexOf(value) + 1;
      break;

    case KEY_OWNERSHIP_TRANSACTION_TYPE :
      taxRateDetails.transaction_type_ownership = futureTransaction.indexOf(value) + 1;
      break;
  }
}


void moveToLastScreen() {
  Navigator.pop(context, true);
}


Future<Null> _selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate)
    setState(() {
      selectedDate = picked;
    });
}




}
