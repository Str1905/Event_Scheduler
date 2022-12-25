import 'package:flutter/material.dart';
import 'package:my_app/app_screen/new_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final List<Widget> _list =  [
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily:'RobotoMono'),
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Event Scheduler"),

      ),
          backgroundColor: Colors.indigoAccent,

      body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: ((context, index) => _list[index])
      ),


      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
            onPressed: () async {
              String newText = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)
                  => const NewEventScreen()));

              setState(() {
                _list.add(
                    Center(
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: 20,
                                   maxWidth: 300,
                                    minWidth: 300,
                              ),
                              padding:EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)
                                  )
                              ),
                              alignment: const Alignment(0.0,0.0),
                              margin: const EdgeInsets.all(10.0),
                              // color: Colors.white,
                              // width: 300.0,
                              // height: MediaQuery.of(context).size.height*0.12,

                              child: Text((newText),
                                  style: const TextStyle(fontFamily:
                                  'RobotoMono' ,
                                      fontWeight: FontWeight.w400 ,
                                        fontSize: 20,
                                      color: Colors.black) ,
                                  maxLines: 5,

                                textAlign: TextAlign.center),
                            ),
                     )

                );
              }
              );
            },
            child: const Icon(Icons.add)
        );
      }),
    ));
  }
}
