
 import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:viber_getx/controller/picker_file_controller.dart';

FilePickerController filePickerController = Get.put(FilePickerController());
Future pickFile()async{
        FilePickerResult?result = await FilePicker.platform.pickFiles(type:FileType.image);
      filePickerController.file.value = result!.files.first;
  }


