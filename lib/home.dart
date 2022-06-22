import 'package:flutter/material.dart';
import './home1.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeField()
    );
  }
}


class HomeField extends StatefulWidget {
  const HomeField({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomeField> {
  // The inital group value
  String _selectedGender = 'male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: Text('Please Select Your Profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),

              ListTile(

                leading: Radio<String>(

                  value: 'male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: const Text('Male'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: const Text('Female'),
              ),
              const SizedBox(height: 25),
              Container(
                margin: EdgeInsets.only(top:30.0),
                child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home1()));
                    },
                    child: const Text('Next')
                ),
              )
            ],
          )),
    );
  }
}
// class HomeField extends StatefulWidget {
//   @override
//   State<HomeField> createState() => _HomeField();
// }
// enum SingingCharacter { Developer, Coder }
// class _HomeField extends State<HomeField>{
//
//   SingingCharacter? _character = SingingCharacter.Developer;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child:SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment : CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(top: 100.0),
//               child: Text('Please Select Your Profile',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
//             ),
//             // ListTile(
//             //   title: const Text('Deveoper'),
//             //   leading: Radio<SingingCharacter>(
//             //     value: SingingCharacter.Developer,
//             //     groupValue: _character,
//             //     onChanged: (SingingCharacter? value) {
//             //       setState(() {
//             //         _character = value;
//             //       });
//             //     },
//             //   ),
//             // ),
//             // ListTile(
//             //   title: const Text('Coder '),
//             //   leading: Radio<SingingCharacter>(
//             //     value: SingingCharacter.Coder,
//             //     groupValue: _character,
//             //     onChanged: (SingingCharacter? value) {
//             //       setState(() {
//             //         _character = value;
//             //       });
//             //     },
//             //   ),
//             // ),
//             Container(
//               margin: EdgeInsets.only(top:30.0),
//               child: ElevatedButton(
//                   onPressed:(){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Home1()));
//                   },
//                   child: const Text('Continue')
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//
//   }
//
//   }
