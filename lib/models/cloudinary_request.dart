import 'dart:io';

class CloudinaryUploadRequest {
  File file;

  CloudinaryUploadRequest({required this.file});

  Map<String, dynamic> toMap() => {'file': file};
}
