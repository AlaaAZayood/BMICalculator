import 'dart:math';
import 'package:flutter/material.dart';

import '../model/result.dart';


const IconData male = IconData(0xe3c5, fontFamily: 'MaterialIcons');

class MyHomePage extends StatefulWidget {
  MyHomePage(

  ) ;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMal = false;
  double hieghtVale = 170;
  int weight = 60;
  int age = 41;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        miExpanded(context,'male'),
                        const SizedBox(width: 15,),
                        miExpanded(context,'female'),
                      ],
                    ),
                  ),
                ),
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
                              children: const [
                                Text('180',
                                    style: TextStyle(
                                        fontSize: 35, fontWeight: FontWeight.w900)),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('CM',
                                    style: TextStyle(
                                      fontSize: 19,
                                    )),
                              ],
                            ),
                            Slider(
                                value: 120.0,
                                max: 220.0,
                                min: 80.0,
                                onChanged: (value) {
                                  print(value);
                                })
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        m2Expanded(context,'weight'),
                        const SizedBox(width: 15,),
                        m2Expanded(context,'age'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.teal,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/10,
                  child: TextButton(onPressed: (){
                   var  result=weight/pow(hieghtVale/100,2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                  result: result,
                                  isMale: isMal,
                                  age: age,
                                )));
                  },
                      child:  Text(
                          'Calculate',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),),
                )

              ],
            )
          ),
        ));
  }

  Expanded miExpanded(BuildContext context,String type) {
    return Expanded(
      child: GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (isMal&&type=='male')||(!isMal&&type=='female') ? Colors.teal : Colors.blueGrey),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon( type=='male'? Icons.male:Icons.female,),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    type=='male'? 'male':'female',
                    style: Theme
                      .of(context)
                      .textTheme
                      .displayLarge,
                )
              ],
            )),
        onTap: () => setState(() => isMal =type=='male'? true:false),
      ),
    );
  }
  Expanded m2Expanded(BuildContext context,String type) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Text(
                  type=='weight'? 'weight':'age',
                  style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  type=='weight'? '$weight':'$age',
                  style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                       type=='age'? age++:weight++;
                      });
                    },
                    heroTag: type=='weight++'? 'weight':'age++',
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        type=='age'? age--:weight--;
                      });
                    },
                    heroTag: type=='weight--'? 'weight':'age--',
                    mini: true,
                    child: const Icon(Icons.remove),
                  ),
                ],
              )

            ],
          )),
    );
  }

}