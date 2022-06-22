import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:temp_auth/login.dart';
import 'package:temp_auth/second.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Internship task',
      home: const dropDown(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class dropDown extends StatefulWidget {
  const dropDown({Key? key}) : super(key: key);

  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  String dropdownvalue = 'English';
  List<String> spinneritem = [
    'English',
    'Hindi',
    'English-US',
    'Chinese',
    'Japanes',
    'Spannish',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainPage'),
      ),
      body: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top:100.0),
              child: Icon(Icons.account_box,size: 50,),
            ),
            Container(
              margin: EdgeInsets.only(top:100.0),
              child: Text('Please Select your language' , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),

            Container(
              margin: EdgeInsets.only(top:30.0),
              child: Text('You can change the language at any time' , style: TextStyle(fontSize: 12),),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.black, style: BorderStyle.solid,width: 0.80),

              ),
              margin: EdgeInsets.only(top:50.0),
              child: DropdownButton<String>(
                hint:Text ('Select Language'),
                value:dropdownvalue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                alignment:Alignment.center,
                style: TextStyle(color: Colors.blue, fontSize: 18 ,fontWeight: FontWeight.bold),

                onChanged: (data)
                {
                  setState(() {
                    dropdownvalue = data.toString();
                  });
                },
                items: spinneritem.map<DropdownMenuItem<String>>((String value)
                {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:30.0),
              child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Second()));
                  },

                  child: const Text('Next')
              ),
            )
          ],
        ),
      ),
    );
  }
}

