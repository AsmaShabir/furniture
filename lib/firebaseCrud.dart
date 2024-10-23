import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture/firestoreServices.dart';

class crud extends StatelessWidget {
  const crud({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(stream:firestoreServices.getAllBags(),builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData){
            var data=snapshot.data!.docs;
              print("data found");
              return ListView.builder(
                itemCount:snapshot.data!.docs.length ,
                itemBuilder:(context,index){

                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.shopping_bag),
                      title: Text("bag colour:"+data[index]["color"]),
                      subtitle: Text("bag type:"+data[index]["type"]),
                      trailing: IconButton(onPressed: ()async{ 
                        // FirebaseFirestore.instance.collection("bags").doc(data[index].id).delete();
                       FirebaseFirestore.instance.collection("bags").doc(data[index].id).update({
                         "color":" pink",
                       });
                      }, icon: Icon(Icons.delete)),
                        
                    ),
                  );
                } ,
              );
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();

          }
          else{
            print("data not found");
            return Container();
          }

        },)
      ),
    );
  }
}

// StreamBuilder(stream: firestoreServices.getUsers(),
// builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot){
// if(snapshot.hasData){
// var data= snapshot.data!;
// return  Column(
// children: [
// Text(data['uid']),
// Text(data['email']),
// Text(data['name']),
// ],
// );
// }
// else{
// return Center(child: CircularProgressIndicator(),);
// }
//
// }),