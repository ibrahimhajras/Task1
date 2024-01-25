import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class Pdf_Page extends StatefulWidget {
  @override
  _Pdf_PageState createState() => _Pdf_PageState();
}
class _Pdf_PageState extends State<Pdf_Page> {
  final sampleUrl = 'http://www.africau.edu/images/default/sample.pdf';
  String? pdfFilePath;
  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final pdfDirectory = Directory('${directory.path}/PDF');
    final file = File('${pdfDirectory.path}/sample.pdf');
    if (await file.exists()) {
      return file.path;
    }
    if (!(await pdfDirectory.exists())) {
      pdfDirectory.createSync(recursive: true);
    }
    final response = await http.get(Uri.parse(sampleUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }void loadPdf() async {
    pdfFilePath = await downloadAndSavePdf();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Load PDF"),
              onPressed: loadPdf,
            ),
            if (pdfFilePath != null)
              Expanded(
                child: Container(
                  child: PdfView(path: pdfFilePath!),
                ),
              )
            else
              Text("PDF is not loaded"),
          ],
        ),
      ),
    );
  }
}
