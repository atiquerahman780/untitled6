import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Login/forgot_password.dart';
import 'package:untitled6/HomeScreen/home_screen.dart';
import 'package:untitled6/Admin/see_product.dart';
import 'package:untitled6/Login/sign_up.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final emailTextEditController = new TextEditingController();
  final passwordTextEditController = new TextEditingController();
  final confirmPasswordTextEditController = new TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In"),
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
                    'Welcome',
                    style: TextStyle(
                        color: Colors.black,fontSize: 30)
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child:
                Text(
                    "Sign In with your email and password",
                    style: TextStyle(color: Colors.grey,fontSize: 17)
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: emailTextEditController,
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
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: passwordTextEditController,
                  obscureText: _isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if(value.length < 6){
                      return 'Please enter more than 6 character password';
                    }

                    return null;
                  },
                  decoration:  InputDecoration(

                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    hintText: "Enter your Password",
                    labelText: 'Password',
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 14,),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: const Text('Forgot Password?',style: TextStyle(color: Colors.orange),),
                    ),
                  ],
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
                    if (_formKey.currentState!.validate()) {

                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailTextEditController.text,
                          password: passwordTextEditController.text,

                        );

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        }
                        else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }

                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                        //Navigator.pushReplacement(context, Products());

                      );
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                    }
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
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUp()),
                        );
                      },
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
