import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/widgets/violetButton.dart';

class PrivacyPoliacy extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h),
          child: Column(
            children: [
              Expanded(
                  child: SfPdfViewer.network(
                    'https://firebasestorage.googleapis.com/v0/b/flutter-travel-app-68f44.appspot.com/o/privacy%20policy%2Fprivacy%20policy%20for%20app.pdf?alt=media&token=37510b65-f179-43ec-b06f-6882bbe40d38',
                    onDocumentLoaded: (PdfDocumentLoadedDetails details){
                      _loaded.value = true;
                    },
                  )
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: Obx(() => _loaded == true? 
                VioletButton("Agree", ()=> Get.toNamed(homePage) ):Text("Still loading")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
