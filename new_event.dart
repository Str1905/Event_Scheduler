import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NewEventScreen();
}

class _NewEventScreen extends State<NewEventScreen> {
  final TextEditingController _texteditingController = TextEditingController();
  bool submit  = false;
  @override
  void initState(){
    super.initState();
    _texteditingController.addListener(() {
      setState(() {
         submit = _texteditingController.text.isNotEmpty;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("New Event")),
        backgroundColor: Colors.indigoAccent,
        body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(

                    autocorrect: true,
                    textAlign: TextAlign.center,
                    controller: _texteditingController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.deepPurple[900],
                        labelText: 'New Event',
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 30,
                        ),
                        labelStyle:
                            const TextStyle(color:
                            Colors.white, fontSize: 30,
                                fontFamily: 'robotoMono'),
                        hintText: 'Enter New Event',
                        hintStyle: const TextStyle(color: Colors.white,
                            fontSize: 20,fontFamily: 'RobotoMono'
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0)
                        )
                    ),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0, height: 2.0,
                        fontFamily: 'RobotoMono'
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Builder(builder: (context) {
                    return SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: submit ? () {
                            String newEventText = _texteditingController.text;
                            Navigator.of(context).pop(newEventText);
                          }:null,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)
                                  )
                              )
                          ),
                          child:
                          const Text("Add",
                              style:TextStyle(fontFamily: 'RobotoMono')
                          )
                      ),
                    );
                  }
                  ),
                )

              ],

            )
        )
    );
  }
}

