
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel_app/ui/route/route.dart';

class Auth{
  final box = GetStorage();

  Future registration(String emailAddress,String password, context) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: emailAddress, password: password);

      var authCredential = userCredential.user;
      if(authCredential!.uid.isNotEmpty){
        Fluttertoast.showToast(msg: "Registration Successful");
        box.write('uid', authCredential.uid);
        Get.toNamed(userform);
      }else{
        print("Sign Up Failed");
      }
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        Fluttertoast.showToast(msg: "The password provide is too weak");
      }else if(e.code == 'email-already-in-use'){
        Fluttertoast.showToast(msg: "The account exists for that email .");
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Error is : $e");
    }
  }


  Future logIn(String emailAddress,String password, context) async{
    try{
      UserCredential userCredential= await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: emailAddress, password: password);

      var authCredential = userCredential.user;
      print(authCredential);
      if(authCredential!.uid.isNotEmpty){
        Fluttertoast.showToast(msg: "Login Successfull");
        box.write('uid', authCredential.uid);
        box.write('formdata', 'submited');
        box.write('privacy', 'agree');
        Get.toNamed(homePage);
      }else{
        print("sign up failed");
      }
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        Fluttertoast.showToast(msg: "The password is too weak");
      }else if(e.code == 'email-already-in-use'){
        Fluttertoast.showToast(msg: "The account already exists for that email.");
      }
    }catch (e){
      Fluttertoast.showToast(msg: "Error is : $e");
    }
  }

  Future logOut(context) async{
    return showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: const Text("Are you sure to logout ?"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () async{
                    await FirebaseAuth.instance.signOut().
                    then((value) => Fluttertoast.showToast(
                        msg: 'LogOut Successfull',
                    ));

                    await box.remove("uid");
                    await box.remove("formdata");
                    await box.remove("privacy");
                    Get.toNamed(signup);
                  },
                  child: const Text("yes"),
              ),

              ElevatedButton(
                  onPressed: ()=>Get.back(),
                  child: const Text('No'),
              ),
            ],
          ),
        )
    );
  }
}