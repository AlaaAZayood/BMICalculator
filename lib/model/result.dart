

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    required this.result,
    required this.isMale,
    required this.age
  });

  final double result;
  final bool isMale;
  final int age;


   String get resultPhrase{
     String resultText=' ';
       if(result>=30) resultText='Oboes';
      else if(result>25&&result<30) resultText='Over';
      else if(result>=18.5&&result<=24.9) resultText='Normal';
       else resultText='thin';

     return resultText;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("result"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  'Gender:${isMale ? 'mail' : 'female'}',
                style:Theme.of(context).textTheme.displayLarge,
              ),

              Text(
                  'age:$age',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                  'result:${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'healthiness:$resultPhrase',
                style:Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
