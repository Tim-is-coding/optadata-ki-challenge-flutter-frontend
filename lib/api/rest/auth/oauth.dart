part of swagger.api;

class OAuth implements Authentication {
  String accessToken;

  OAuth({required this.accessToken});

  @override
  void applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    headerParams["Authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuY29yZS53aW5kb3dzLm5ldC8iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9jYWY4NzJlYy0yMjEwLTRkNmYtYjJmMi01MzI3MDliYzc1YzYvIiwiaWF0IjoxNjkzODYzMDIwLCJuYmYiOjE2OTM4NjMwMjAsImV4cCI6MTY5Mzg2ODAzNCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhVQUFBQXZ1ZkoxSmtoWU5mTTV6bnFIeEtjMTFUUUh1QlNMcnROVlV4ZVJycEluYmVweUFwajVoc09LNytISEt6ZXh6bUx1Q1RSMnBGMG9wbjljam1tZE1F…BuZW9uaXVzLmRlIiwidXRpIjoiRkV1WUtKdVp0MG1WemdfNVRxRW5BQSIsInZlciI6IjEuMCIsIndpZHMiOlsiNjJlOTAzOTQtNjlmNS00MjM3LTkxOTAtMDEyMTc3MTQ1ZTEwIl0sInhtc190Y2R0IjoxNjg5MTA0MDUwfQ.WoOIfeuL7F_xxQmn5YDAKhp2xmqaMaAD_ecY_fxvfuTXcxT_UxDttnAnehVyhQ_ZFOrteDIITXboCihqzyArR9thGwBNTYVqgrNV-MJPpWz1xEeKZayCW6bW8dyax_H7ylcN-MTivoRtU1QUcyrKQxYpnR0_U85K57bOFbrRzwiz7-yV23BZSK2EBNarGBi2zDj-NM6NN-HLNbusyGY-ajgZAsY5oWaofFvSHfWux0fApoA4cdzfHhxC53Gqgu1d8u6DghT_FF7Utv2BAQB0egMHmFePCaae5R_Mxdbm4YNLH0EApBJKbUo0WFr-D2gRo-YpcDHMDiAY9ZtRU7iaDw";
  }

  void setAccessToken(String accessToken) {
    this.accessToken = accessToken;
  }
}
