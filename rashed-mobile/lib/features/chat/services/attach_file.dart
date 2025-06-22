import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:rashed/core/utils/big_print.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

import '../../../core/utils/app_toast.dart';
import '../cubit/chat_cubit.dart';
import '../data/models/message.dart';

Future<void> attachPdf(ChatCubit cubit) async {
  try {
    // Pick PDF file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = File(result.files.single.path!);

      try {
        // Extract text from PDF
        final pdfText = await ReadPdfText.getPDFtext(file.path);
        bigPrint(pdfText);

        final message = Message(
          id: '0000',
          isFromBot: false,
          type: 'FILE',
          content: pdfText,
          fileName: file.path.split('/').last,
          createdAt: DateTime.now(),
        );
        bigPrint(jsonEncode(message.toDto()));
        cubit.sendMessage(customMessage: message);

      } catch (e) {
        AppToast.toast(msg: 'Failed to read PDF: ${e.toString()}');
      }
    }
  } catch (e) {
    AppToast.toast(msg: 'Error: ${e.toString()}');
  }
}