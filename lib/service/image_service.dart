import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/constants/app_constant.dart';


class ImageService {
  // Function to upload image to the backend
  Future<String?> uploadImage(File image, String type) async {
    var headers = {
      "Content-type": "application/json",
      "Accept": "*/*"
    };

    // Build the request URI
    var url = Uri.parse(AppConstant.BASE_URL + AppConstant.IMAGE_UPLOAD_URL);

    // Create a MultipartRequest
    var request = http.MultipartRequest('POST', url);

    // Add the image file to the request
    request.files.add(await http.MultipartFile.fromPath(
      'image', // This should match the backend's expected field name
      image.path,
      filename: '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}',
    ));

    // Add headers
    request.headers.addAll(headers);

    // Send the request and capture the response
    var streamedResponse = await request.send();

    // Convert the streamed response to a normal response
    var response = await http.Response.fromStream(streamedResponse);

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Handle the response
    if (response.statusCode == 200) {
      return "Upload successful";
    } else {
      print("Upload failed with status: ${response.statusCode}");
      return null;
    }
  }
}
