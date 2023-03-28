import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {

final double result;
final bool isMale;
final int age;
  BMIResult({
    required this.result,
    required this.age,
    required this.isMale,
});
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
        leading:  IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: const Icon(Icons.keyboard_arrow_left)
        ),
        title: const Text('BMI RESULT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isMale?'Gender : Male':'Gender : Female',
              style: const TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ),
            Text(
              'Result : ${result.round()}',
              style: const TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ), Text(
              'age : $age',
              style: const TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
            ),
        Text(
          'healthiness:$resultPhrase',style: const TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
          )
          ],
        ),
      ),
    );
  }
}
