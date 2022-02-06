import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled6/Login/sign_in.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final emailTextEditController = new TextEditingController();
  final passwordTextEditController = new TextEditingController();
  final confirmPasswordTextEditController = new TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _errorMessage = '';

  void processError(final PlatformException error) {
    setState(() {
      _errorMessage = error.message!;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"),
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
                    'Register Account',
                    style: TextStyle(
                        color: Colors.black,fontSize: 30)
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child:
                Text(
                    "Complete your detail",
                    style: TextStyle(color: Colors.grey,fontSize: 17)
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  controller: emailTextEditController,
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
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: confirmPasswordTextEditController,
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
                    hintText: "Enter your Confirm Password",
                    labelText: 'Confirm Password',
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
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
                    if (_formKey.currentState!.validate()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailTextEditController.text,
                            password: passwordTextEditController.text,

                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');

                        }

                      } catch (e) {

                        print(e);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                    }
                  },
                  child: const Text("Continue", style: TextStyle(fontSize: 17),),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(0.0),

                    child: Text("By continuing your confirm that you agree",style: TextStyle(color: Colors.grey),),


              ),
              const Padding(
                padding: EdgeInsets.all(0.0),

                    child: Text("with our Term and Condition",style: TextStyle(color: Colors.grey),),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
