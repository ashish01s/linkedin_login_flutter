import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'apiCalls.dart';
import 'linkedInAuth.dart';

class LinkedInLogin{
  getToken({context,clientId,clientSecret,callbackUrl}) async {
    final code = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LinkedInAuth(clientId: clientId,callBackUrl: callbackUrl),
        ));
    if (code != null) {
      return callTokenApi(code,clientId,clientSecret,callbackUrl);
    }
  }
  callTokenApi(code,clientId,clientSecret,redirectUri) async {
    var params = {
      "grant_type":"authorization_code",
      "code":code,
      "client_id":clientId,
      "client_secret":clientSecret,
      "redirect_uri":redirectUri
    };
    var result = await CallApi("POST",params,"https://www.linkedin.com/oauth/v2/accessToken");
    return result["access_token"];
  }
}