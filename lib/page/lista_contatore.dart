import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contatori/page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContatorePage extends StatefulWidget {
  const ContatorePage({Key? key}) : super(key: key);







  @override
  State<ContatorePage> createState() => _ContatorePageState();
}

class _ContatorePageState extends State<ContatorePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        leading:  IconButton(icon: Icon(Icons.backspace),onPressed:torna ),
      ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection("contatori").snapshots(),
        builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          return ListView(
            children:snapshot.data!.docs.map((document) {
              return
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(document["data"],style: const TextStyle(fontSize: 30,color: Colors.black)),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("Campo 3",style: const TextStyle(fontSize: 30,color: Colors.black),),
                        SizedBox(width: 30,),
                        Text(document["camp3"],style: const TextStyle(fontSize: 30,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("Campo 9",style: const TextStyle(fontSize: 30,color: Colors.black),),
                        SizedBox(width: 30,),
                        Text(document["camp9"],style: const TextStyle(fontSize: 30,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("Campo 8",style: const TextStyle(fontSize: 30,color: Colors.black),),
                        SizedBox(width: 30,),
                        Text(document["camp8"],style: const TextStyle(fontSize: 30,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("Campo 6",style: const TextStyle(fontSize: 30,color: Colors.black),),
                        SizedBox(width: 30,),
                        Text(document["camp6"],style: const TextStyle(fontSize: 30,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("Campo 4",style: const TextStyle(fontSize: 30,color: Colors.black),),
                        SizedBox(width: 30,),
                        Text(document["camp4"],style: const TextStyle(fontSize: 30,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 30,),
                     Row(
                       children: [
                         Text("Campo 5",style: const TextStyle(fontSize: 30,color: Colors.black),),
                         SizedBox(width: 30,),
                         Text(document["camp5"],style: const TextStyle(fontSize: 30,color: Colors.black),),
                       ],
                     ),
                    SizedBox(height: 30,),
                     Row(
                       children: [
                         Text(document["temperatura"],style: const TextStyle(fontSize: 40,color: Colors.black),),
                         SizedBox(width: 10,),
                         Text("°C",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                       ],
                     )
                  ],




              );
            }).toList(),

          );
        },
      ) ,


    );
  }


   torna(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage(title: 'contatore',)));
  }
}