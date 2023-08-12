import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(home: Page1());
  }
}

class Page1 extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
        child :Center(
          child: Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Login',style: TextStyle(fontSize: 40),),
                  CircleAvatar(
                    radius: 40,
                  backgroundImage: AssetImage('assets/ball.png'),),
                  TextFormField(
                    validator: (value){
                      print('validation:- ${value}');
                      if(value?.length !=10)
                        {
                          return 'please enter valide number';
                        }
                      else
                        {
                          return null;
                        }
                  },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Enter Number',
                      hintText: 'Number'
                    ),
                  ),
                  ElevatedButton(onPressed:()
                  {
                    if(_formkey.currentState!.validate())
                    {
                      print('yes');
                    }
                    else
                    {
                      print('No');
                    }
                  },
                      child: Text('Login')
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
                  }
                      , child: Text('Sign Up') )
                ],
              ),
            ),
          ),
        )
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget{
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
            child :Center(
              child: Form(
                      key: _formkey,
                child: Column(
                  children: [
                    Text('Login',style: TextStyle(fontSize: 40),),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/ball.png'),),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value){
                          print('validation:- ${value}');
                          if(value?.length !=10)
                          {
                            return 'please enter valide number';
                          }
                          else
                          {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Phone',
                            hintText: 'number'
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                       validator: (value){
                         if(value!.length <8 || value!.length >16)
                           {
                             return 'invalid';
                           }
                         return null;
                       },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password',
                            hintText: 'text'
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                      validator: (value){
                        if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)){
                          return null;
                        }
                        else{
                          return 'enter valid email';
                        }
                      },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Email',
                            hintText: 'text'
                        ),
                      ),
                    ),

                    ElevatedButton(onPressed:()
                    {
                      if(_formkey.currentState!.validate())
                      {
                        print('yes');
                      }
                      else
                      {
                        print('No');
                      }
                    },
                        child: Text('Submit')
                    ),

                    TextButton(onPressed: (){
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=>Page1()));
                    }
                        , child: Text('Go Back') )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}