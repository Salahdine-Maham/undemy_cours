import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class  NewTransation extends StatefulWidget {
  
   Function addTx ;
   NewTransation(this.addTx);

  @override
  State<NewTransation> createState() => _NewTransationState();
}

class _NewTransationState extends State<NewTransation> {
 final titleController = TextEditingController();
 final amountController = TextEditingController();

 void submitData(){

   final entredTitle = titleController.text;
   final entredAmount = double.parse(amountController.text);

   if (entredTitle.isEmpty || entredAmount <= 0 ){
     return ;
   }

   widget.addTx(entredTitle,entredAmount);
   Navigator.of(context).pop();

 }



  @override
  Widget build(BuildContext context) {
    return Card( 
              elevation: 5,

              child: Container( 
                
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration:  InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      onSubmitted: (_) => submitData(),
                    ),
                    TextField(
                      decoration:  InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      onSubmitted: (_) => submitData(),
                    ),

                   FlatButton(
                        child: Text('Add Transaction'),
                        textColor: Colors.purple,
                        onPressed: submitData,
            ),
                  ],
                ),
                
              ),
            
            );

  }
}