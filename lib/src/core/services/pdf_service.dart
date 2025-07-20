import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class PdfService {
  final Dio _dio = Dio();

  Future<String> downloadPDF(String url, {String? fileName}) async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String name = fileName ?? path.basename(url).split('?').first;
      final String fullPath = path.join(tempDir.path, name);

      final File file = File(fullPath);
      if (await file.exists()) {
        return fullPath;
      }

      await _dio.download(url, fullPath);
      return fullPath;
    } catch (e) {
      throw Exception('Failed to download PDF: $e');
    }
  }

  Future<void> deletePDF(String filePath) async {
    try {
      final File file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print('Error while deleting $e');
    }
  }

  Future<void> clearPDFCache() async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final List<FileSystemEntity> files = tempDir.listSync();

      for (final file in files) {
        if (file.path.endsWith('.pdf')) {
          await file.delete();
        }
      }
    } catch (e) {
      print('Error clearing PDF cache: $e');
    }
  }
}
