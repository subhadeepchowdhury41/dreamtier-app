import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File?> fileFromUrl(String url) async {
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    final bytes = res.bodyBytes;
    final data = ByteData.view(bytes.buffer);
    var tempDir = await getTemporaryDirectory();
    return await File('${tempDir.path}/img').writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  } else {
    return null;
  }
}
