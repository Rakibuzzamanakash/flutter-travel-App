import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyScreen extends StatelessWidget {

  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;
  
 showPrivacyPolicy(data){
   return SfPdfViewer.network(
     data['url'],
     onDocumentLoaded: (PdfDocumentLoadedDetails details){
       _loaded.value = true;
     },
   );
 }


 // CollectionReference userInfo = FirebaseFirestore.instance.collection('privacy-policy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('privacy-policy').doc('11111').snapshots(),
        builder:(context, snapshot ){
          var data = snapshot.data;
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
             return showPrivacyPolicy(data);
          }
        },
      ),
    );
  }
}