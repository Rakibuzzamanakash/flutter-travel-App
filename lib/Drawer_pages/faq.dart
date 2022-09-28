import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FaqScreen extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _isLoaded = false.obs;

  showFaqPdf(data){
    return SfPdfViewer.network(
      data['url'],
      onDocumentLoaded: (PdfDocumentLoadedDetails details){
        _isLoaded.value = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("faq")
              .doc('111110')
              .snapshots(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
             return showFaqPdf(data);
            }
          }),
    );
  }
}
