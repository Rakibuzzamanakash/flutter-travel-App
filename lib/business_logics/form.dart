import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel_app/ui/route/route.dart';

class UserInfo{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final box = GetStorage();

  sendFormDataToDB(
      String name,
      int phone,
      String address,
      String dob,
      String gender,
      ) async{
    try {
      CollectionReference _course = FirebaseFirestore.instance.collection('users-form-data');
      _course.doc(_auth.currentUser!.email).set({
        'name' : name,
        'phone' : phone,
        'address' : address,
        'dob' : dob,
        'gender' : gender,
      }).whenComplete(
              () {
                Fluttertoast.showToast(msg: 'Added Successfully');
                box.write('formdata', 'submited');
                Get.toNamed(privacypolicy);
              }
      );
    }catch(e){
      Fluttertoast.showToast(msg: "Error : $e");
    }
  }
}