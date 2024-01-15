part of swagger.api;

class AbrechnungLiteApi {
  final ApiClient apiClient;

  AbrechnungLiteApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  Future<LightAbrechnungsResult?> requestAbrechnungLite(
      {required LightAbrechnungsrequest lightAbrechnungsRequest}) async {
    // create path and map variables
    String path = "abrechnung/light";

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    String contentType = "application/json";
    List<String> authNames = ["aussendienst_api"];

    var response = await apiClient.invokeAPI(
        path,
        'POST',
        queryParams,
        lightAbrechnungsRequest,
        headerParams,
        formParams,
        contentType,
        authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else {
      return LightAbrechnungsResult.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    }
  }

  Future<LightAbrechnungsPrecheckResult?> requestAbrechnungLitePrecheck(
      {required LightAbrechnungsrequest lightAbrechnungsRequest}) async {
    // create path and map variables
    String path = "abrechnung/light/precheck";

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    String contentType = "application/json";
    List<String> authNames = ["aussendienst_api"];

    var response = await apiClient.invokeAPI(
        path,
        'POST',
        queryParams,
        lightAbrechnungsRequest,
        headerParams,
        formParams,
        contentType,
        authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else {
      return LightAbrechnungsPrecheckResult.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    }
  }
}
