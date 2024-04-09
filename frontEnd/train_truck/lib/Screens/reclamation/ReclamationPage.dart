import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReclamationPage extends StatefulWidget {
  const ReclamationPage({super.key});

  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top:100),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Text("Reclamations",style: TextStyle(
                      color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400,
                      fontFamily: 'Oxygen',fontSize: 20)),
                  Container(
                    color: Theme.of(context).primaryColor,
                    width: (width) /1.8,
                    height: 2,
                  ),
                ],)),
              SizedBox(height: 100,),
              TextFormField(
                  minLines: 10,
                  maxLines: 320,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'description',
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.2),

                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              SizedBox(height: 100,),

              ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  minimumSize:
                  MaterialStateProperty.all(Size(50, 50)),
                  backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text(
                  "Envoyer",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),),

            ],
          ),
        ),
      ),
    );
  }
}
