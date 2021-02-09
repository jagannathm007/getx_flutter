import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/config/constants.dart';
import 'package:getx_flutter/models/api_response.dart';

class GetHttp extends GetConnect {
  static Future<String> _getUrl(String apiName, List params) async {
    String _url = "";
    if (params.length > 0) {
      _url = apiName + "?";
      for (int i = 0; i < params.length; i++) {
        _url = _url + '${params[i]["key"]}=${params[i]["value"]}';
        if (i + 1 != params.length) _url = _url + "&";
      }
    } else {
      _url = apiName;
    }
    String url = AppConstants.apiUrl + '$_url';
    return url;
  }

  static Future<APIResponse> getMethod(String apiName, List params) async {
    //initialize api response
    APIResponse apiData = new APIResponse();

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      //if no internet found
      apiData.message = "No Internet Found!";
      apiData.data = 0;
      apiData.isSuccess = false;
      return apiData;
    } else {
      String _url = await _getUrl(apiName, params);
      log(_url);
      try {
        GetHttpClient getm = GetHttpClient();
        final _response = await getm.get(_url);
        if (_response.status.hasError && _response.statusCode != 200) {
          apiData.message = _response.statusText;
          apiData.data = 0;
          apiData.isSuccess = false;
          return apiData;
        } else {
          apiData.message = _response.body["Message"];
          apiData.data = _response.body;
          apiData.isSuccess = _response.body["IsSuccess"];
          return apiData;
        }
      } catch (e) {
        apiData.message = e.toString();
        apiData.data = 0;
        apiData.isSuccess = false;
        return apiData;
      }
    }
  }

  static Future<APIResponse> postMethod(String apiName, formData) async {
    //initialize api response
    APIResponse apiData = new APIResponse();

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      //if no internet found
      apiData.message = "No Internet Found!";
      apiData.data = 0;
      apiData.isSuccess = false;
      return apiData;
    } else {
      String _url = AppConstants.apiUrl + apiName;
      log("Requesting to $_url");
      try {
        GetHttpClient postm = GetHttpClient();
        final _response = await postm.post(_url, body: formData);
        if (_response.status.hasError && _response.statusCode != 200) {
          log("request failed server error: ${_response.statusText}");
          apiData.message = _response.statusText.contains("SocketException: OS Error")
              ? "Unable to connect with server."
              : _response.statusText;
          apiData.data = 0;
          apiData.isSuccess = false;
          return apiData;
        } else {
          log("response from server : ${_response.body["Message"]}");
          apiData.message = _response.body["Message"];
          apiData.data = _response.body["Data"];
          apiData.isSuccess = _response.body["IsSuccess"];
          return apiData;
        }
      } catch (e) {
        apiData.message = e.toString();
        apiData.data = 0;
        apiData.isSuccess = false;
        return apiData;
      }
    }
  }
}
