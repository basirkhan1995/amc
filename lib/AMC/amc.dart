import 'package:amc/input_field.dart';
import 'package:flutter/material.dart';

class AMC extends StatefulWidget {
  const AMC({super.key});

  @override
  State<AMC> createState() => _AMCState();
}

class _AMCState extends State<AMC> {


  final z = TextEditingController();
  final y = TextEditingController();

  double sixMonth = 180;
  double amc = 0;
  double x = 0;
  double d = 0;


  final formKey = GlobalKey<FormState>();
  bool isValidated = false;
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: size.height *.4,
                      width: size.width *.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 1
                          )
                        ]
                      ),
                      child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("AMC",style: TextStyle(fontSize: 16,color: Colors.grey),),
                                Text(amc.toStringAsFixed(2),
                                  style: TextStyle(fontSize: size.width /7, fontWeight: FontWeight.bold,color: Colors.teal),),
                              ],
                            ),
                          ))),
                ),

                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                    
                        InputField(
                          hintText: "Medicine",
                          icon: Icons.medical_services_rounded,
                          controller: z,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Medicine quantity is required";
                            }
                            return null;
                          },
                        ),
                    
                        InputField(
                          hintText: "Stock out",
                          icon: Icons.calendar_month,
                          controller: y,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Stock out is required";
                            }
                            return null;
                          },
                        ),
                    
                        const SizedBox(height: 25),
                    
                        Container(
                          width:  size.width * .82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.teal
                          ),
                          child: TextButton(
                              onPressed: (){
                            if(formKey.currentState!.validate()){
                              setState(() {
                                isValidated = false;
                                calculation();
                              });
                            }else{
                              setState(() {
                                isValidated = true;
                                amc = 0;
                              });
                            }
                          }, child: const Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 16),)),
                        ),
                        const SizedBox(height: 15),
                        isValidated? Text("Fill the required fields to calculate",style: TextStyle(color: Colors.red.shade900),) : const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Calculation
  void calculation(){
    x = double.parse(z.text) / 6;
    d = sixMonth / (sixMonth - double.parse(y.text));
    amc = x * d;
  }
}
