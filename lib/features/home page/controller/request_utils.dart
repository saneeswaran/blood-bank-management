import 'dart:developer';
import 'dart:io';

import 'package:blood_bank/core/constants/constats.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fpdart/fpdart.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestUtils {
  static Future<Either<Failure, List<File>>> pickImages() async {
    try {
      bool hasPermission = false;

      log('🟡 pickImages started');

      // ---------------- PERMISSION ----------------
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final sdkInt = androidInfo.version.sdkInt;

        log('📱 Android SDK: $sdkInt');

        final permission = sdkInt >= 33
            ? Permission.photos
            : Permission.storage;

        log('🔐 Requesting permission: $permission');

        final status = await permission.request();
        log('🔐 Permission request result: $status');

        hasPermission = status.isGranted;

        if (!hasPermission) {
          log('⏳ Permission not granted, re-checking after delay');
          await Future.delayed(const Duration(milliseconds: 300));
          final newStatus = await permission.status;
          log('🔐 Permission status after delay: $newStatus');
          hasPermission = newStatus.isGranted;
        }
      } else if (Platform.isIOS) {
        log('📱 Platform: iOS');

        final status = await Permission.photos.request();
        log('🔐 Photos permission result: $status');

        hasPermission = status.isGranted;

        if (!hasPermission) {
          log('⏳ Re-checking iOS permission after delay');
          await Future.delayed(const Duration(milliseconds: 300));
          final newStatus = await Permission.photos.status;
          log('🔐 Photos permission status after delay: $newStatus');
          hasPermission = newStatus.isGranted;
        }
      } else {
        log('📱 Platform: Other');

        final status = await Permission.storage.request();
        log('🔐 Storage permission result: $status');
        hasPermission = status.isGranted;
      }

      if (!hasPermission) {
        log('❌ Storage permission denied');
        return const Left("Storage Permission Denied");
      }

      log('✅ Permission granted');

      // ---------------- PICK FILES ----------------
      log('📂 Opening file picker');

      final pickedFiles = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
      );

      if (pickedFiles == null || pickedFiles.files.isEmpty) {
        log('❌ No images selected');
        return const Left('No image selected');
      }

      log('📸 Picked ${pickedFiles.files.length} images');

      // ---------------- COMPRESS ----------------
      final List<File> compressedFiles = [];

      for (final picked in pickedFiles.files) {
        if (picked.path == null) {
          log('⚠️ Skipping file with null path');
          continue;
        }

        final originalFile = File(picked.path!);
        log('🖼️ Compressing: ${originalFile.path}');
        log('📦 Original size: ${originalFile.lengthSync()} bytes');

        final compressedBytes = await FlutterImageCompress.compressWithFile(
          originalFile.path,
          quality: 60,
          format: CompressFormat.jpeg,
        );

        if (compressedBytes == null) {
          log('❌ Compression failed for: ${originalFile.path}');
          continue;
        }

        final compressedPath =
            '${originalFile.parent.path}/compressed_${originalFile.uri.pathSegments.last}';

        final compressedFile = await File(
          compressedPath,
        ).writeAsBytes(compressedBytes);

        log('✅ Compressed saved: ${compressedFile.path}');
        log('📦 Compressed size: ${compressedFile.lengthSync()} bytes');

        compressedFiles.add(compressedFile);
      }

      if (compressedFiles.isEmpty) {
        log('❌ No images were successfully compressed');
        return const Left('Image compression failed');
      }

      log('🎉 Compression completed. Total files: ${compressedFiles.length}');
      return Right(compressedFiles);
    } catch (e, st) {
      log('🔥 Error in pickImages: $e');
      log('🧵 StackTrace: $st');
      return Left(e.toString());
    }
  }
}
