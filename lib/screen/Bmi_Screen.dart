import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/screen/bmi_result.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});



  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool isMale=false;
  double height=120;
  int weight=90,age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:!isMale? Colors.grey:Colors.teal),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.female,
                            size: 60,
                          ),
                          Text('Female', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                          setState(() {
                            isMale=true;
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:isMale? Colors.grey:Colors.teal),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.male,
                            size: 55,
                          ),
                          Text('Male', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900) )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                child: Container(
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.teal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: TextStyle(fontSize: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                      Text('${height.round()}',
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w900)),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('CM',
                          style: TextStyle(
                            fontSize: 19,
                          )),
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged: (value) {
                        setState(() {
                          height=value;
                        });
                      })
                ],
            ),
          ),
              )),
          Expanded(
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text('AGE', style: TextStyle(fontSize: 25)),
                             Text('$age',
                                 style: const TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w900)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  heroTag: 'age--',
                                  mini: true,
                                child: const Icon(Icons.remove),
                                ),  FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  heroTag: 'age++',
                                  mini: true,
                                child: const Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text('WEIGHT', style: TextStyle(fontSize: 25)),
                             Text('$weight',
                                style: const TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w900)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  heroTag: 'w--',
                                  mini: true,
                                child: const Icon(Icons.remove),
                                ),  FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                  heroTag: 'w++',
                                  mini: true,
                                child: const Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ),
          Container(
            width: double.infinity,
            color: Colors.red,
            child: MaterialButton(
              onPressed: () {
                var result=weight/pow(height/100,2);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>BMIResult(age:age, result: result, isMale: isMale ,))
                );
              },
              child: const Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
