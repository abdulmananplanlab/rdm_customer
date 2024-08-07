import 'dart:io';
import 'dart:typed_data';

import 'package:common/http/http.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as path;

typedef HttpFormData = FormData;
typedef HttpMultipartFile = MultipartFile;
typedef HttpListFormat = ListFormat;

class HttpFile extends Equatable {
  HttpFile({
    required this.path,
    this.bytes,
    String? name,
    int? size,
  })  : _id = uuid.v4(),
        _name = name,
        _size = size;

  final String _id;
  final String path;
  final Uint8List? bytes;
  final String? _name;
  final int? _size;

  @override
  List<Object?> get props => [
        _id,
        path,
        bytes,
        _name,
        _size,
      ];

  @override
  String toString() => "HttpFile: ${{
        "id": _id,
        "path": path,
        "name": name,
        "size": size,
      }}";

  String get name => _name ?? path.fileName;

  int get size => _size ?? bytes?.length ?? 0;

  double get sizeInKb => size / 1024;

  double get sizeInMb => sizeInKb / 1024;

  bool get isOver1MB => sizeInMb > 1;

  bool get isOver2MB => sizeInMb > 2;

  bool get isOver6MB => sizeInMb > 6;

  String get type => name.fileType();

  MediaType? get mediaType => path.mediaType;

  File toFile() => File(path);

  HttpFormData toFormData(String key) => HttpFormData.fromMap(
        {
          key: bytes == null ? multipartByIOFile() : multipart(),
        },
        HttpListFormat.multiCompatible,
      );

  HttpMultipartFile? multipart({Map<String, List<String>>? headers}) =>
      bytes == null
          ? null
          : HttpMultipartFile.fromBytes(
              bytes!,
              filename: name,
              contentType: mediaType,
              headers: headers,
            );

  Future<HttpMultipartFile> multipartByIOFile({
    Map<String, List<String>>? headers,
  }) =>
      HttpMultipartFile.fromFile(
        path,
        filename: name,
        contentType: mediaType,
        headers: headers,
      );

  static Future<List<HttpMultipartFile>> toMultipart(
    List<HttpFile> files, {
    Map<String, List<String>>? headers,
  }) async {
    final multipartFiles = <HttpMultipartFile>[];
    await Future.forEach(
      files,
      (HttpFile file) async =>
          multipartFiles.add(await file.multipartByIOFile(headers: headers)),
    );
    return multipartFiles;
  }
}

extension FileString on String {
  /// return the file name of file path.
  String get fileName => path.basename(this);

  /// return the file name without type.
  String get fileNameWithoutType => path.basenameWithoutExtension(this);

  /// return file type without dot i.e. pdf.
  String fileType([int level = 1]) => path.extension(this, level);

  /// return file path without type.
  /// Takes an optional parameter `level` which makes possible to return
  /// multiple extensions having `level` number of dots. If `level` exceeds the
  /// number of dots, the full extension is returned. The value of `level` must
  /// be greater than 0, else `RangeError` is thrown.
  String get filePathWithoutType => path.withoutExtension(this);

  /// return MIME type from file name (null if there is no such extension).
  String? get mimeType => mime(this);

  /// return MEDIA type from file name (null if there is no such extension).
  MediaType? get mediaType =>
      mimeType != null ? MediaType.parse(mimeType!) : null;
}
