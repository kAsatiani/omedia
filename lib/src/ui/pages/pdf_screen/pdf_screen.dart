import 'package:flutter/material.dart';
import 'package:omedia/src/core/services/pdf_service.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:ui_kit/themes/app_colors.dart';

const String pdfUrl =
    'https://f1-mock.omedialab.com/api/obligations/transactions';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  String? localPath;
  bool isLoading = true;
  String? errorMessage;
  PdfService pdfService = PdfService();

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _loadPDF() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final path = await pdfService.downloadPDF(pdfUrl);
      setState(() {
        localPath = path;
        isLoading = false;
      });
    } catch (e) {
      print('Error downloading PDF: $e');
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayLight,
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: isLoading || localPath == null
            ? Center(child: CircularProgressIndicator())
            : PDFView(
                filePath: localPath,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: false,
                pageFling: true,
                onError: (error) {
                  setState(() {
                    errorMessage = 'Error rendering PDF: $error';
                  });
                },
              ),
      ),
    );
  }
}
