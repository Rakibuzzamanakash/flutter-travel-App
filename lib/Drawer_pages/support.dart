import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/ui/widgets/support_field.dart';

class SupportScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    CollectionReference user =FirebaseFirestore.instance.collection('support');
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: user.doc('11000').get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Padding(
                padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
                child: Column(
                  children: [
                    Text(
                      "${data['title']}",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    Divider(color: Colors.blue,),
                    supportField('phone', "${data['phone']}"),
                    supportField('E-mail', "${data['email']}"),
                    supportField('Facebook', "${data['facebook']}"),
                  ],
                ),
              );
            }

            return Center(child: Text("loading...."));
          }
      ),
    );
  }
}

// Padding(
// padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
// child: Column(
// children: [
// Text(
// "If you have any problems , please contact us . We are at your service all the time.",
// style: TextStyle(
// fontSize: 20.sp,
// ),
// ),
// Divider(color: Colors.blue,),
// supportField('phone', '01521436796'),
// supportField('E-mail', 'a@b.com'),
// supportField('Facebook', 'http://facebook.com/'),
// ],
// ),
// )
