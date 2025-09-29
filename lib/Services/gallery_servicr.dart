import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryService {
  final ImagePicker _picker = ImagePicker();
  // Checar pemissão de acesso a camera
  Future _checkCamerePermission() async {
    final status = await Permission.camera.request();
    // if (status == PermissionStatus.granted) {
    //   return status;
    // } Também pode fazer desse modo
    return status == PermissionStatus.granted;
  }

  // Checar a permissão de acesso a galeria
  Future<bool> _checkGalleryPermission() async {
    final status = await Permission.photos.request();
    return status == PermissionStatus.granted;
  }

  Future<File?> selectImageFromGallery() async {
    bool permission = await _checkGalleryPermission();
    if (!permission) {
      throw Exception("Permissão negada para acessar a galeria de imagens");
    }

    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    }

    return null;
  }

  Future<File?> captureImageFromCamera() async {
    final permission = await _checkCamerePermission();
    if (!permission) {
      throw Exception("Permissão negada para acessar a câmera");
    }

    XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      return File(image.path);
    }

    return null;
  }

  Future<List<File>> selectMultipleImages() async {
    final permission = await _checkCamerePermission();

    if (!permission) {
      throw Exception("Sem Permissão para acessar á galeria de imagens");
    }

    List<XFile> images = await _picker.pickMultiImage(
      limit: 5,
    ); // _picker.pickMultiImage(limit: 5) Limitando a quantidade de fotos a serem selecionadas

    return images.map((xfile) => File(xfile.path)).toList();

    // return listFiles; Finalização
  }
}
