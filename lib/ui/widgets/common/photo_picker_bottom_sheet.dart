import 'dart:io';

import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PhotoPickerResult {
  final bool isDelete;
  final File? image;

  const PhotoPickerResult({
    required this.isDelete,
    this.image,
  });
}

class PhotoPickerBottomSheet extends HookWidget {
  static Future<PhotoPickerResult?> pick(
    BuildContext context,
  ) async {
    final result = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PhotoPickerBottomSheet();
      },
    );

    return castOrNull<PhotoPickerResult>(result);
  }

  static Future<PhotoPickerResult?> pickAndCrop(
    BuildContext context,
  ) async {
    final result = await pick(context);

    if (result == null) return null;
    if (result.isDelete) return result;

    final File? croppedFile = await ImageCropper().cropImage(
      sourcePath: result.image!.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      maxWidth: 300,
      maxHeight: 300,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Sesuaikan',
        toolbarColor: ColorPallete.primaryColor,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );

    return PhotoPickerResult(
      isDelete: result.isDelete,
      image: croppedFile,
    );
  }

  const PhotoPickerBottomSheet({
    Key? key,
  }) : super(key: key);

  ImagePicker get _picker => ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorPallete.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.0),
            topRight: Radius.circular(14.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 24.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    width: 48,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Column(
                  children: [
                    _buildButton(
                      Icons.delete_rounded,
                      'Hapus foto',
                      () {
                        Navigator.of(context).pop(
                          PhotoPickerResult(
                            isDelete: true,
                          ),
                        );
                      },
                    ),
                    _buildButton(
                      Icons.insert_photo_rounded,
                      'Galeri',
                      () async {
                        final XFile? image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );

                        Navigator.of(context).pop(
                          PhotoPickerResult(
                            isDelete: false,
                            image: image != null ? File(image.path) : null,
                          ),
                        );
                      },
                    ),
                    _buildButton(
                      Icons.camera_rounded,
                      'Kamera',
                      () async {
                        final XFile? image = await _picker.pickImage(
                          source: ImageSource.camera,
                        );

                        Navigator.of(context).pop(
                          PhotoPickerResult(
                            isDelete: false,
                            image: image != null ? File(image.path) : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    IconData icon,
    String title,
    Function() onClick,
  ) {
    return InkWell(
      onTap: onClick,
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: kBorderedDecoration.border,
                ),
                padding: const EdgeInsets.all(11),
                child: Icon(
                  icon,
                  color: ColorPallete.darkGray,
                ),
              ),
              SizedBox(width: 20.0),
              Text(
                title,
                style: kTextTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
