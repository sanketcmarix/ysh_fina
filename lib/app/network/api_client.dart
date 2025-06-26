import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../routes/app_pages.dart';
import '../storage/storage.dart';
import '../utils/utils.dart';
import 'network.dart';


class ApiClient extends GetConnect {
  @override
  GetHttpClient get httpClient {
    final httpClient = GetHttpClient(
      baseUrl: ApiConstants.baseProviderV1,
    );
    httpClient.addRequestModifier<void>((request) {
      /// get access token from local storage
      /// E.g. Bearer access token
      ///

      final token = AppStorage.getAccessToken();
      Logger.i("JWT :: $token");
      if (token != '') {
        request.headers['Authorization'] = 'Bearer $token';
      }
      Logger.reqLog(request);

      return request;
    });
    return httpClient;
  }

  /// Http get request with proper error and status handling
  Future<Map<String, dynamic>?> getRequest(
    String url, {
    Map<String, String>? header,
    Map<String, dynamic>? queryParam,
    Function(String?)? handleError,
    Function(dynamic?)? handleSuccess,
  }) async {
    try {
      Logger.queryParam(queryParam);
      final hasInternetConnected = await checkInternet;
      if (hasInternetConnected) {
        final response = await get(
          url,
          headers: header,
          query: queryParam,
        );
        Logger.resLog(response);
        if (response.status.isOk) {
          final decodedBody = jsonDecode(response.bodyString!);
          handleSuccess?.call(decodedBody);
        } else {
          if (handleError != null) {
            if (response.statusCode == 401) {
              if (AppStorage.getIsLogin()) {
                AppStorage.clearStorage();
                Get.offAllNamed(Routes.LOGIN);
              }
            }
            handleError((response.body as Map)['message']);
          } else {
            _handleError(response.statusCode, response.body);
          }
        }
      } else {
        // todo :: Handle no internet error view with route
        return null;
      }
    } on Exception catch (e) {
      Logger.e('Error: $e');
      return null;
    }
    return null;
  }

  /// Http post request with proper error and status handling
  Future<Map<String, dynamic>?> postRequest(
    String url, {
    Map<String, String>? header,
    Map<String, dynamic>? bodyParam,
    Function(String?)? handleError,
    Function(dynamic?)? handleSuccess,
  }) async {
    try {
      Logger.queryParam(bodyParam);
      final hasInternetConnected = await checkInternet;
      if (hasInternetConnected) {
        final response = await post(
          url,
          jsonEncode(bodyParam),
          headers: header,
        );
        Logger.resLog(response);
        if (response.status.isOk) {
          final decodedBody = jsonDecode(response.bodyString!);
          handleSuccess?.call(decodedBody);
        } else {
          if (handleError != null) {
            if (response.statusCode == 401) {
              if (AppStorage.getIsLogin()) {
                AppStorage.clearStorage();
                Get.offAllNamed(Routes.LOGIN);
              }
            }
            handleError((response.body as Map)['message']);
          } else {
            _handleError(response.statusCode, response.body);
          }
          return null;
        }
      } else {
        Logger.i('No internet connection.');
        return null;
      }
    } on Exception catch (e) {
      Logger.e('Error: $e');
      return null;
    }
  }

  /// Http put request with proper error and status handling
  Future<Map<String, dynamic>?> putRequest(
    String url, {
    Map<String, String>? header,
    Map<String, dynamic>? bodyParam,
    Function()? handleError,
  }) async {
    try {
      Logger.queryParam(bodyParam);
      final hasInternetConnected = await checkInternet;
      if (hasInternetConnected) {
        final response = await put(
          url,
          jsonEncode(bodyParam),
          headers: header,
        );
        Logger.resLog(response);
        if (response.status.isOk) {
          final decodedBody = jsonDecode(response.bodyString!);
          return decodedBody;
        } else {
          _handleError(response.statusCode, response.body);
          return null;
        }
      } else {
        Logger.i('No internet connection.');
        return null;
      }
    } on Exception catch (e) {
      Logger.e('Error: $e');
      return null;
    }
  }

  /// Http delete request
  Future<Map<String, dynamic>?> deleteRequest(
    String url, {
    Map<String, String>? header,
    Function(String?)? handleError,
    Map<String, dynamic>? bodyParam,
    Function(dynamic?)? handleSuccess,
  }) async {
    try {
      Logger.queryParam(bodyParam);
      final hasInternetConnected = await checkInternet;
      if (hasInternetConnected) {
        final response = await request(
          url,
          'DELETE',
          body: bodyParam,
          headers: header,
        );

        Logger.resLog(response);

        if (response.status.isOk) {
          final decodedBody = jsonDecode(response.bodyString!);
          handleSuccess?.call(decodedBody);
          // return decodedBody;
        } else {
          if (handleError != null) {
            if (response.statusCode == 401) {
              if (AppStorage.getIsLogin()) {
                AppStorage.clearStorage();
                Get.offAllNamed(Routes.LOGIN);
              }
            }
            handleError((response.body as Map)['message']);
          } else {
            _handleError(response.statusCode, response.body);
          }
          // return null;
        }
      } else {
        Logger.i('No internet connection.');
        return null;
      }
    } on Exception catch (e) {
      Logger.e('Error: $e');
      return null;
    }
  }



  /// Check device is connected to the internet or not
  /// by lookup given host name
  Future<bool> get checkInternet async {
    try {
      final result = await InternetAddress.lookup('flutter.dev');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        await AppStrings.noInternet.showInternetSnackBar;
        return false;
      }
    } on SocketException catch (_) {
      await AppStrings.noInternet.showInternetSnackBar;
      return false;
    }
  }

  /// Handle error with specified status code with message
  void _handleError(int? statusCode, dynamic responseBody) {
    switch (statusCode) {
      case 400:
        show4XXErrorMessage("${responseBody['message']} Please try again.");
        break;
      case 401:
        if (AppStorage.getIsLogin()) {
          AppStorage.clearStorage();
          Get.offAllNamed(Routes.LOGIN);
        }
        show4XXErrorMessage("Unauthorized: ${responseBody['message']}");

        break;
      case 403:
        show4XXErrorMessage("Your account is deactivated or Inactive. Please contact support for further assistance.");
        break;
      case 404:
        show4XXErrorMessage("Looks like your session expired. Please log in again to continue.");
        break;
      case 500:
        showError("Server Error: Please try again later.");
        break;
      case 503:
        showError("Service Unavailable: The server is temporarily down.");
        break;
      default:
        show4XXErrorMessage("There is an issue Occurred. Please try again later.");
    }
  }

  /// Show Get SnackBar when server send response with error
  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.errorRed,
      colorText: AppColors.whiteColor,
    );
  }

  /// Error Snack bar for session expire
  void show4XXErrorMessage(String message) {
    Get.snackbar(
      'Oops!',
      message,
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.errorRed,
      colorText: Colors.black87,
    );
  }
}
