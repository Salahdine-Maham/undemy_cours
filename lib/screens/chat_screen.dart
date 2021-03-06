import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter chat'),
        actions : [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                  ),
                  value: 'Logout',
                  ),
            ],
            onChanged: (itemIdentifier){
              if (itemIdentifier == 'Logout'){
              FirebaseAuth.instance.signOut();}
            },
          ),
        ]
        ),
          body:StreamBuilder(
            stream: Firestore.instance.collection('chats/cg3ZLPXaBhxOFjMGLQZw/messages').snapshots() ,
            builder: (ctx , streamSnapshot) {

              if(streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
              }
              final documents = streamSnapshot.data.documents;
               return ListView.builder(
                                itemCount: documents.length,
                                itemBuilder: (ctx,index) => Container(
                                       padding: EdgeInsets.all(8),
                                       child: Text(documents[index]['text']),
                                            ),
                                      );
             },
             
                         ), 
    
         
  
         floatingActionButton: FloatingActionButton(
           child: Icon(Icons.add),
           onPressed: (){
             Firestore.instance.collection(
               'chats/cg3ZLPXaBhxOFjMGLQZw/messages').add(
               {'text': 'cest mon premier requete'});
             
           },
           )
         );  
   
  }



}