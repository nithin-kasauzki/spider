import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:vibration/vibration.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'mass.dart';

import 'length.dart';
import 'temperature.dart';
import 'mass.dart';
import 'speed.dart';
void main() {
  runApp( MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool check=false;
  bool clicked=false;

  Color Textcolors=Colors.blue;

  Color temperaturecolor= Colors.deepPurpleAccent;
  Color lengthcolor= Colors.pinkAccent;
  Color weightcolor= Colors.deepPurpleAccent;
  Color speedcolor= Colors.deepPurpleAccent;
  Color buttonONcolor= Colors.pinkAccent;
  Color buttonOFFcolor= Colors.deepPurpleAccent;

  Color Backgroundclr= Colors.blue.shade50;



  Length length= Length();
  Temperature temperature=Temperature();
  Speed speed=Speed();
  Weight weight=Weight();


  String currentCategory='Length';
  int cls_index=1;

  String startValue1='cm';
  String startValue2='cm';
  double convertedMeasure=0;
  String convertedMeasurestr='';
  double userInput=0;
  double userInput2=0;
  var myController= TextEditingController();
  var myController2= TextEditingController();

  List<Text> History=[];


  //@override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Text submitbutton= check?Text(' check '):Text('convert');
 List unit=[temperature,length,weight,speed];



    //buttoncolor= clicked?Colors.pink:Colors.limeAccent;


    bool isNumeric(String s) {
      if (s == null) {
        return false;
      }
      return double.tryParse(s) != null;
    }

    void showError(){
      Backgroundclr=Colors.red.shade400;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('!!!! fill valid value !!!!',
              style: TextStyle(
                  color: Colors.red
              ),),
          );
        },
      );
      Future.delayed(Duration(seconds: 1),(){
        setState((){Backgroundclr=Colors.blue.shade50;});
      });
    }

//k
    void initState(){
      userInput=0;
      super.initState();
    }

    return  Scaffold(

        appBar: AppBar(
          title: Text('Unit Converter',style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.blueAccent.shade100
        ),
        body: Container(
          color: Backgroundclr,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$currentCategory',style: TextStyle(color: Textcolors, fontSize: 30.0,fontWeight: FontWeight.bold,fontFamily:'OleoScriptSwashCaps'),),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: (){
                          Vibration.vibrate(duration: 50,amplitude: 10);
                          setState((){
                            currentCategory='Temperature';
                            temperaturecolor=buttonONcolor;
                            lengthcolor=buttonOFFcolor;
                            weightcolor=buttonOFFcolor;
                            speedcolor=buttonOFFcolor;
                            cls_index=0;
                            startValue1='*c';
                            startValue2='*c';
                          });
                        },
                        icon: Icon(Icons.thermostat_outlined,
                        size: 40.0,
                          color: temperaturecolor,
                        ),
                        tooltip:'temperature'
                    ),
                    IconButton(
                        onPressed: (){
                          Vibration.vibrate(duration: 50,amplitude: 5);
                          setState((){

                            currentCategory='Length';
                            temperaturecolor=buttonOFFcolor;
                            lengthcolor=buttonONcolor;
                            weightcolor=buttonOFFcolor;
                            speedcolor=buttonOFFcolor;

                            cls_index=1;
                            startValue1='cm';
                            startValue2='cm';
                          });
                        },
                        icon: Icon(Icons.straighten,
                          size: 40.0,
                          color: lengthcolor,
                        ),
                        tooltip:'length'
                    ),
                    IconButton(
                        onPressed: (){
                          Vibration.vibrate(duration: 50,amplitude: 10);
                          setState((){
                            temperaturecolor=buttonOFFcolor;
                            currentCategory='Weight';
                            lengthcolor=buttonOFFcolor;
                            weightcolor=buttonONcolor;
                            speedcolor=buttonOFFcolor;

                            cls_index=2;
                            startValue1='kg';
                            startValue2='kg';
                          });
                        },
                        icon: Icon(Icons.scale,
                          size: 40.0,
                          color: weightcolor,
                        ),
                        tooltip:'weight'
                    ),
                    IconButton(
                        onPressed: (){
                          Vibration.vibrate(duration: 50,amplitude: 20);
                          setState((){
                            temperaturecolor=buttonOFFcolor;
                            currentCategory='Speed';
                            lengthcolor=buttonOFFcolor;
                            weightcolor=buttonOFFcolor;
                            speedcolor=buttonONcolor;

                            cls_index=3;
                            startValue1='km/h';
                            startValue2='km/h';
                          });
                        },
                        icon: Icon(Icons.speed,
                          size: 40.0,
                          color: speedcolor,
                        ),
                        tooltip:'speed'
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                  child: Divider(
                    color: Textcolors,
                    thickness: 1.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "  From",
                      style: TextStyle(
                        fontSize: 20.0,

                        color: Textcolors,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Text(
                        'checking mode',
                        style: TextStyle(color: Textcolors, ),
                      ),
                      SizedBox(width: 7.0,),
                      FlutterSwitch(

                        activeColor: buttonONcolor,
                        inactiveColor: buttonOFFcolor,

                        value: check,

                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            check = val;
                          });
                        },
                      ),
                      SizedBox(width: 10.0,)
                    ],),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(

                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter values',
                          ),
                          controller: myController,

                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          value: startValue1,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              startValue1 = newValue!;
                            });
                          },
                          items:
                              unit[cls_index].dropdownValues.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )

                    ),

                  ],
                ),
                Text(
                  "  To",
                  style: TextStyle(
                    fontSize: 20.0,

                    color: Textcolors,
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: check,
                      child: Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(

                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter values',
                            ),
                            controller: myController2,

                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !check,
                      child: Expanded(
                        flex: 4,
                        child: Container(
                          height: 51.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                                //color: Colors.grey,
                                borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.black38)
                            ),

                            child: Text(
                              convertedMeasure.toStringAsFixed(3),
                              style: TextStyle(fontSize: 20.0),
                            )),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          value: startValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              startValue2 = newValue!;
                            });
                          },
                          items: unit[cls_index].dropdownValues
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed:
                    (){
                      Vibration.vibrate(duration: 100);
                        setState((){
                      if(myController.text!=null && myController.text!='' && isNumeric(myController.text))
                      { if(check==false)
                        {
                            userInput = double.parse(myController.text);
                            unit[cls_index]
                                .Convert(startValue1, startValue2, userInput);
                            convertedMeasure = (unit[cls_index].converted);
                            convertedMeasurestr =
                                convertedMeasure.toStringAsFixed(3);
                            History.insert(
                                0,
                                Text(
                                    '$userInput $startValue1 -> $convertedMeasurestr $startValue2'));
                            print(History);
                            Fluttertoast.showToast(
                                msg: "Success",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM_LEFT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueGrey.shade100,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          }
                      else
                      { if(myController2.text!=null && myController2.text!='' && isNumeric(myController2.text))
                        {
                              userInput = double.parse(myController.text);
                              userInput2=double.parse(myController2.text);
                              unit[cls_index]
                                  .Convert(startValue1, startValue2, userInput);
                              convertedMeasure = (unit[cls_index].converted);
                              convertedMeasurestr =
                                  convertedMeasure.toStringAsFixed(3);
                              History.insert(
                                  0,
                                  Text(
                                      '$userInput $startValue1 -> $convertedMeasurestr $startValue2'));
                              print(History);

                              if((userInput2-convertedMeasure)/convertedMeasure <=0.0025 && (userInput2-convertedMeasure)/convertedMeasure >= -0.0025 )
                              {
                                Backgroundclr=Colors.lightGreenAccent;
                                Fluttertoast.showToast(
                                    msg: "Correct",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM_LEFT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueGrey.shade100,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                                Future.delayed(Duration(seconds: 1),(){
                                  setState((){Backgroundclr=Colors.blue.shade50;});
                                });
                              }
                              else{
                                Vibration.vibrate();
                                Backgroundclr=Colors.red;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text('Wrong Answer\nCorrect Answer is $convertedMeasurestr',
                                        style: TextStyle(
                                            color: Colors.black
                                        ),),
                                    );
                                  },
                                );
                                Future.delayed(Duration(seconds: 1),(){
                                  setState((){Backgroundclr=Colors.blue.shade50;});
                                });
                              }
                            }
                            else{showError();}
                          }
                        }
                      else{
                        showError();

                      }
                    });}
                        , child: submitbutton,
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder()
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  child: Divider(
                    height: 20.0,
                    color: Textcolors,
                    thickness: 1.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      setState((){
                        History.clear();
                      });
                    }, icon: Icon(Icons.delete,color: Colors.deepPurple,),
                      tooltip: 'delete history',
                    ),
                    Row(children: [
                      Text(
                        'show/hide history',
                        style: TextStyle(color: Textcolors, ),
                      ),
                      SizedBox(width: 7.0,),
                      FlutterSwitch(

                        activeColor: buttonONcolor,
                        inactiveColor: buttonOFFcolor,
                        //width: 5.0,
                        //height: 55.0,
                        //valueFontSize: 25.0,
                        //toggleSize: 15.0,
                        value: clicked,
                        //borderRadius: 30.0,

                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            clicked = val;
                          });
                        },
                      ),
                    SizedBox(width: 10.0,)
                    ],),


                  ],
                ),
                Visibility(
                  visible: clicked,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: 150.0,
                        margin: EdgeInsets.all(40.0),
                          decoration:
                          BoxDecoration(color: Colors.blue.shade100),
                          child: ListView.builder(
                            itemCount: History.length,
                            itemBuilder: (context,index)=> (History[index]),
                            //children: History,
                          ),
                      ))
                ),

              ],
            ),
          ),
        ),
      );

  }
}
