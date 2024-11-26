import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget(
      {super.key,
      required this.image,
      required this.onTap,
      required this.label});

  final XFile? image;
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: size.width * .3,
            height: size.width * .3,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
              image: image != null
                  ? DecorationImage(
                      image: FileImage(File(image!.path)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: image == null
                ? Icon(Icons.camera_alt, size: 30, color: Colors.grey[600])
                : null,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
