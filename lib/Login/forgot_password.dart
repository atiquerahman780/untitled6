import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Login/sign_in.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
 late String _email;
  final _formKey = GlobalKey<FormState>();
  final emailTextEditController = new TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password"),
        backgroundColor: Colors.orange,
        shadowColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,


          child: Column(
            children: [
              const SizedBox(height: 30),
              const Center(
                child:
                Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.black,fontSize: 30)
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child:
                Text(
                    "Please enter your email and we will send",
                    style: TextStyle(color: Colors.grey,fontSize: 17)
                ),
              ),
              const Center(
                child:
                Text(
                    "you a link to return to your account",
                    style: TextStyle(color: Colors.grey,fontSize: 17)
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: emailTextEditController,
                  onChanged: (value){
                    setState(() {
                      _email=value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    hintText: "Enter your Email",
                    labelText: 'Email',
                    //errorText: 'Error message',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(60.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    // onPrimary: Colors.white,
                    //shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(200, 50), //////// HERE
                  ),
                  onPressed: () async {
                    _firebaseAuth.sendPasswordResetEmail(email: _email);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: const Text("Continue", style: TextStyle(fontSize: 17),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 14,),
                      ),
                      onPressed: (){},
                      child: const Text("Sign Up" ,style: TextStyle(color: Colors.orange),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
