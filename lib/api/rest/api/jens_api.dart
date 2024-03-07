part of swagger.api;

class JensApi {
  final ApiClient apiClient;

  JensApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  Future<List<AiRecommondation>> requestAiSuggestions(
      {required RecommendationRequest recommendationRequest}) async {
    // create path and map variables
    String path = "jens/ai/suggestions/";

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
        recommendationRequest.toJson(),
        headerParams,
        formParams,
        contentType,
        authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else {
      return (apiClient.deserialize(
                  utf8.decode(response.bodyBytes), 'List<AiRecommondation>')
              as List)
          .map((item) => item as AiRecommondation)
          .toList();
    }
  }

  Future<String> icd10CodeTranslation({required String diagnose}) async {
    // create path and map variables
    String path = "icd10_code/?query=$diagnose";

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    String contentType = "application/json";
    List<String> authNames = ["aussendienst_api"];

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, null,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else {
      return utf8.decode(response.bodyBytes).replaceAll("\"", "");
    }
  }
}
