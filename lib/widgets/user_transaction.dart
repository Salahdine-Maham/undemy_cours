import 'package:flutter/material.dart';
import 'package:undemy_cours/widgets/transaction_list.dart';
import 'package:undemy_cours/widgets/new_transaction.dart';
import'package:undemy_cours/models/transaction.dart';


class  UserTansaction extends StatefulWidget {
  

  @override
  _UserTansactionState createState() => _UserTansactionState();
}

class _UserTansactionState extends State<UserTansaction> {


   final List<Transaction> _userTransaction = [

  Transaction(id: 't1', title: 'shows', amount: 13.34 , date: DateTime.now()),
  Transaction(id: 't2', title: 'cloth', amount: 22.44 , date: DateTime.now()),

  ];


void _addNewTransaction ( String txTitle, double txAmount) {

  final newTx= Transaction(title: txTitle, amount: txAmount , date: DateTime.now(), id: DateTime.now().toString() );

  setState(() {
    _userTransaction.add(newTx);


  });
}

  @override
  Widget build(BuildContext context) {
    return Column( children: <Widget>[

            NewTransation(_addNewTransaction),
            TransactionList(_userTransaction),
            
    ],
      
    );
  }
}