import 'package:flutter/material.dart';
import 'package:zit_admin_screens/api/apiRequests.dart';
import 'package:zit_admin_screens/app_screens/admin_board.dart';
import 'package:zit_admin_screens/constant.dart';

class log_in extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loginState();
  }
}

class loginState extends State<log_in> {
  final LoginformKey = GlobalKey<FormState>();
    final PasswordController = TextEditingController();
    final usernameController = TextEditingController();
    bool passToggle=true;

  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Pcolor,
        body: Center(
            child: Container(
                height: 400,
                width: screenWidth / 2.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 30,
                        color: Colors.black12,
                      )
                    ]),
                child: Form(
                  key: LoginformKey,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(screenHeight / 22),
                      child: const Align(
                          alignment: Alignment.topCenter,
                          child: Text('تسجيل الدخول')),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenHeight / 22),
                      child: TextFormField(

                          controller: usernameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 117, 170, 188),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 117, 170, 188),
                            ),
                            hintText: "أدخل اسم المستخدم",
                            // hintStyle: Color. fromARGB(255, 117, 170, 188),
                          ),
                        //     validator: (value) {
                        //   if(value!=null){
                        //     return "هذا الحقل مطلوب";
                        //   }
                        //   else{
                        //     return null;
                        //   }
                        // },
                          ),

                    ),
                    Padding(
                      padding: EdgeInsets.all(screenHeight / 22),
                      child: TextFormField(
                        obscureText: passToggle,
                        controller: PasswordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Pcolor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle=!passToggle;
                              });
                            },
                            child:  Icon(passToggle?
                              Icons.visibility_off:Icons.visibility,
                                color: Pcolor),
                          ),
                          hintText: "أدخل كلمة السر ",
                          // hintStyle: Color. fromARGB(255, 117, 170, 188),
                        ),

                        // validator: (value) {
                        //   if(value!=null&&value.length<7){
                        //     return "كلمة السر يجب ان تتكون من سبعه حروف وارقام";
                        //   }
                        //   else{
                        //     return null;
                        //   }
                        // },

                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 52, 108, 126)),
                          //end coloring
                          //start bordering
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child: const Text(
                        'دخول',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                         showDialog(context: context, 
                            builder: (context){
                              return Center(
                              child: CircularProgressIndicator(
                                color: Pcolor,
                              ),
                            );}

                              );  
                       // if (LoginformKey.currentState!.validate()) {
                          await databaseHelper.loginData(
                              username: usernameController.text,
                              password: PasswordController.text);
                          if (databaseHelper.success == true) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const board();
                            }));
                          
                        
                        
                          } else {
                            print(databaseHelper.success);
                          }
                          
                        },
                         
                        
                     // },
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "ليس لديك حساب؟ انشاء حساب",
                          style: TextStyle(
                            color: Buttonscolor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ]),
                ))));
  }
}
