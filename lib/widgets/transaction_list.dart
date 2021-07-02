
import 'package:flutter/material.dart';
import 'package:undemy_cours/models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {

   final List<Transaction> transactions ;

   TransactionList(this.transactions);

 

  @override
  Widget build(BuildContext context) {

    return Container( 
       height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index ){
     return Card( 
                child: Row(children: <Widget>[
                  Container(

                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20) ,
                   
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: 
                            Colors.purple,
                            width: 2
                            )
                            ),
                    
                    padding: EdgeInsets.all(10),

                    child: Text(
                      '\$${transactions[index].amount}', 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,

                        ),
                    ),
                  ),

                  Column( children: <Widget>[

                    Container( 
                      margin: EdgeInsets.symmetric(vertical:10,horizontal:15),
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 2)),
                      padding: EdgeInsets.all(10),  
                      child: Text( transactions[index].title,
                        style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                       ),
                       ),  
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 7),
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 2)),
                      padding: EdgeInsets.all(5),
                      child :Text(
                        DateFormat.yMMMMd().format(transactions[index].date ),
                    )
                    ),

                  ],)
                ],)
                );


        },


        itemCount: transactions.length,


     
            ),
      
      
    );
  }
}