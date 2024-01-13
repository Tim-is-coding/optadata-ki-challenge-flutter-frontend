part of 'api.dart';

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {
  // final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  String basePath;
  var client = Client();

  final Map<String, String> _defaultHeaderMap = {};
  final Map<String, Authentication> _authentications = {};

  final _RegList = RegExp(r'^List<(.*)>$');
  final _RegMap = RegExp(r'^Map<String,(.*)>$');

  ApiClient(
      {
      //this.basePath = "https://neonius-rest-backend.azurewebsites.net/api/v1/"
      this.basePath = "http://localhost:8080/api/v1/"}) {}

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');

        default:
          {
            Match? match;

            if (value is List) {
              match = _RegList.firstMatch(targetType);
              if (match != null) {
                final tt = match[1];

                if (tt != null) {
                  return value.map((v) => _deserialize(v, tt)).toList();
                }
              }
            }

            if (value is Map) {
              match = _RegMap.firstMatch(targetType);
              if (match != null) {
                final tt = match[1];

                if (tt != null) {
                  return Map.fromIterables(
                      value.keys, value.values.map((v) => deserialize(v, tt)));
                }
              }
            }
          }
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      throw ApiException(500, 'Exception during deserialization.');
    }
    throw ApiException(
        500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return jsonVal;

    var decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object? obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(
      String path,
      String method,
      List<QueryParam> queryParams,
      LightAbrechnungsrequest? body,
      Map<String, String> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames,
      {List<MultipartFile>? files}) async {
    //var accessToken = await UserAccountPersistenceApi.getAccessToken();

    var ps = queryParams.where((p) => p.value != null).map((p) =>
        '${Uri.encodeComponent(p.name)}=${Uri.encodeComponent(p.value)}');
    String queryString = ps.isNotEmpty ? '?${ps.join('&')}' : '';

    String url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;
    //headerParams['Authorization'] = "Bearer $accessToken";

    if (body is MultipartRequest) {
      throw UnimplementedError();
    } else {
      var response;

      var msgBody = serialize(body?.toJson());
      //msgBody = msgBody.replaceAll("\\\\", "\\");
      switch (method) {
        case "POST":
          response = await client.post(
            Uri.parse(url),
            headers: headerParams,
            body: msgBody,
          );
        case "PUT":
          response = await client.put(Uri.parse(url),
              headers: headerParams, body: msgBody);
        case "DELETE":
          response = await client.delete(Uri.parse(url), headers: headerParams);
        case "PATCH":
          response = await client.patch(Uri.parse(url),
              headers: headerParams, body: msgBody);
        default:
          response = await client.get(Uri.parse(url), headers: headerParams);
      }

      if (response.statusCode == 401 || response.statusCode == 403) {
        // throw UnauthorizedException();
      }
      return response;
    }
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }
}
