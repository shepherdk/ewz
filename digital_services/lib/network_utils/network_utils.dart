import 'dart:convert';
import 'dart:io';
import 'package:digital_services/utils/urls.dart';
import "package:http/http.dart" as http;

class NetworkUtils {

  static const String baseURL = BaseURL.dev;
  static String apiToken = 'auth';

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json",
  "Accept": "application/json",
  };

  Map<String, String> headerAuth = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Accept": "application/json",
    HttpHeaders.authorizationHeader:"Bearer "+ apiToken,
  };


   NetworkUtils({String token='auth'}){
     //print(token);
     apiToken=token;
     print("apiToken $apiToken");

   }
  Future<http.Response> get(operation) async  {
    return await http.get(
        baseURL + operation,
        headers: headers
    );
  }

  Future<http.Response> getAuth(operation) async {
        print(baseURL + operation);
    return await http.get(
        baseURL + operation,
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Bearer "+apiToken,
        }
    );
  }

  Future<http.Response> post(operation, body) async {
    return await http.post(
      baseURL + operation,
      body: json.encode(body),
      headers: headers
    );
  }

  Future<http.Response> postAuth(operation, body) async {
    return await http.post(
        baseURL + operation,
        body: json.encode(body),
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Bearer "+ apiToken,
        }
    );
  }

  //A PUT request is meant to replace a resource or create it if it doesn’t exist.
  Future<http.Response> put(operation, body) async {
    return await http.put(
      baseURL + operation,
      body: body,
      headers: {
        "Content-Type":"application/json",
        "Authorization":"Bearer "+apiToken,
      }
    );
  }

  //  A PATCH request is meant to modify an existing resource.
  Future<http.Response> patch(operation, body) async {
    return await http.put(
        baseURL + operation,
        body: body,
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Bearer "+apiToken,
        }
    );
  }

  // Delete
  Future<http.Response> delete(operation) async {
    return await http.delete(
      baseURL + operation,
      headers: {
        "Content-Type":"application/json",
        "Authorization":"Bearer "+apiToken,
      }
    );
  }

}