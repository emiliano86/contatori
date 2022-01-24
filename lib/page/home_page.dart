
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'lista_contatore.dart';
final contatoreReferenze=FirebaseFirestore.instance.collection("contatori");
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController campo3Controller=TextEditingController();
  TextEditingController campo4Controller=TextEditingController();
  TextEditingController campo5Controller=TextEditingController();
  TextEditingController campo6Controller=TextEditingController();
  TextEditingController campo8Controller=TextEditingController();
  TextEditingController campo9Controller=TextEditingController();
  TextEditingController tempController=TextEditingController();
DateTime _dateTime = DateTime.now();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(


          children: <Widget>[

            Row(

              children:  [
                SizedBox(width: 20,),
                 const Expanded(child:Text("Campo3",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),), ),
                SizedBox(width: 20,),

                Expanded(child:TextField(
                  controller: campo3Controller,
                  decoration: const InputDecoration(

                    filled: true,
                    fillColor: Colors.grey,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,


                  ),
                ),)
              ],
            ),
            SizedBox(height: 20,),
            Row(

             children:  [
               SizedBox(width: 20,),
               const Expanded(child: Text("Campo9",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
               SizedBox(width: 20,),
               Expanded(
                 child: TextField(
                   controller: campo9Controller,
                   decoration: const InputDecoration(

                     filled: true,
                     fillColor: Colors.grey,
                     border: InputBorder.none,
                     enabledBorder: InputBorder.none,


                   ),
                 ),),
             ],
           ),
            SizedBox(height: 20,),
            Row(

              children:  [
                SizedBox(width: 20,),
                const Expanded(child: Text("Campo8",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                SizedBox(width: 20,),
                Expanded(
                  child: TextField(
                    controller: campo8Controller,
                    decoration: const InputDecoration(

                      filled: true,
                      fillColor: Colors.grey,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,


                    ),
                  ),),
              ],
            ),
            SizedBox(height: 20,),
            Row(

              children:  [
                SizedBox(width: 20,),
                const Expanded(child: Text("Campo6",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                SizedBox(width: 20,),
                Expanded(
                  child: TextField(
                    controller: campo6Controller,
                    decoration: const InputDecoration(

                      filled: true,
                      fillColor: Colors.grey,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,


                    ),
                  ),),
              ],
            ),
            SizedBox(height: 20,),
            Row(

              children:  [
                SizedBox(width: 20,),
                const Expanded(child: Text("Campo5",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                SizedBox(width: 20,),
                Expanded(
                  child: TextField(
                    controller: campo5Controller,
                    decoration: const InputDecoration(

                      filled: true,
                      fillColor: Colors.grey,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,


                    ),
                  ),),
              ],
            ),
            SizedBox(height: 20,),

            Row(

                  children:  [
                    SizedBox(width: 20,),
                    const Expanded(child: Text("Campo4",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        controller: campo4Controller,
                        decoration: const InputDecoration(

                          filled: true,
                          fillColor: Colors.grey,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,


                        ),
                      ),),
                  ],
                ),
            SizedBox(height: 10,),
            Row(
             children:   [
               Expanded(child: Text("Temp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
               Expanded(child: TextField(
                 controller: tempController,
                 decoration: const InputDecoration(

                   filled: true,
                   fillColor: Colors.grey,
                   border: InputBorder.none,
                   enabledBorder: InputBorder.none,


                 ),
               ),
               ),
             ],

           ),
            SizedBox(height: 50,),
            Row(
             children: [
               FlatButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                   builder: (context) => ContatorePage())), child: Text("Guarda Lista",style: TextStyle(fontSize: 30),),color: Colors.grey,),
               SizedBox(width: 50,),
               FlatButton(onPressed: salvaContatori, child: Text("Salva",style: TextStyle(fontSize: 30),),color: Colors.greenAccent,),
             ],
           ),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  salvaContatori() {
    contatoreReferenze.doc().set({
      "camp3":campo3Controller.text,
      "camp6":campo6Controller.text,
      "camp8":campo8Controller.text,
      "camp9":campo9Controller.text,
      "camp4":campo4Controller.text,
      "camp5":campo5Controller.text,
      "temperatura":tempController.text,
      "data":_dateTime.toString(),
    });
    setState(() {
      campo3Controller.clear();
      campo6Controller.clear();
      campo9Controller.clear();
      campo8Controller.clear();
      campo4Controller.clear();
      campo5Controller.clear();
      tempController.clear();
    });
  }
}