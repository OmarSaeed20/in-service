import 'dart:io' hide HttpResponse;

import 'package:dio/dio.dart' hide Headers;
import 'package:in_service/index.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  //?  <<<<<<<<<<<<<<<<<<<<<<<<   register   >>>>>>>>>>>>>>>>>>>>>>>>
  @POST(EndPoints.register)
  Future<AuthenticationModel> register({
    @Body() required RegisterParameter parameters,
    @Header("Accept-Language") required String lang,
  });

  @PATCH(EndPoints.verifyCodeRegister)
  Future<String> verifyCodeRegister({
    @Path("id") required int id,
    @Field("otp") required String code,
    @Header('Accept-Language') required String lang,
  });

  @GET(EndPoints.resendCodeRegister)
  Future<String> resendCodeRegister({
    @Path("id") required int id,
    @Header('Accept-Language') required String lang,
  });

//?  <<<<<<<<<<<<<<<<<<<<<<<<   login   >>>>>>>>>>>>>>>>>>>>>>>>
  @GET(EndPoints.anonymous)
  Future<AuthenticationModel> anonymous({
    @Header('Accept-Language') required String lang,
  });

  @POST(EndPoints.login)
  Future<AuthenticationModel> login({
    @Field("email") required String phone,
    @Field("password") required String password,
    @Header('Accept-Language') required String lang,
  });

  @POST(EndPoints.loginRefresh)
  Future<TokenModel> loginRefresh({
    @Field("refresh") required String refresh,
    @Header('Accept-Language') required String lang,
  });

  @POST(EndPoints.tokenVerify)
  Future<TokenVerifyModel> tokenVerify({
    @Field("token") required String token,
    @Header('Accept-Language') required String lang,
  });

  //?  <<<<<<<<<<<<<<<<<<<<<<<<   forget password   >>>>>>>>>>>>>>>>>>>>>>>>
  @POST(EndPoints.phoneOrEmail)
  Future<String> setEmailAddress({
    @Field("email") required String email,
    @Header('Accept-Language') required String lang,
  });

  @POST(EndPoints.verifyCodeForget)
  Future<String> verifyEmailAddress({
    @Field("email") required String email,
    @Field("otp") required String code,
    @Header('Accept-Language') required String lang,
  });

  @PATCH(EndPoints.resetPassword)
  Future<String> resetPassword({
    @Field("email") required String email,
    @Field("otp") required String code,
    @Field("password") required String password,
    @Header('Accept-Language') required String lang,
  });

  //?  <<<<<<<<<<<<<<<<<<<<<<<<   setting   >>>>>>>>>>>>>>>>>>>>>>>>

  @PUT(EndPoints.updateProfile)
  Future<void> updatePassword({
    @Path("id") required int id,
    @Field("password") required String password,
    @Field("password_confirmation") required String passwordConfirm,
    @Header('Authorization') required String token,
    @Header('Accept-Language') required String lang,
  });
  @PUT(EndPoints.updateProfile)
  @MultiPart()
  Future<AuthenticationModel> updateProfile({
    @Path("id") required int id,
    @Part(name: "name") String? name,
    @Part(name: "code_country") String? codeCountry,
    @Part(name: "mobile") String? mobile,
    @Part(name: "image") File? image,
    @Header('Authorization') required String token,
    @Header('Accept-Language') required String lang,
  });

  @GET(EndPoints.getUserData)
  Future<AuthenticationModel> getUserData({
    @Path('id') required int id,
    @Header('Authorization') required String token,
    @Header('Accept-Language') required String lang,
  });

  @POST(EndPoints.contactUs)
  Future<void> contactUs({
    @Field("message") required String message,
    @Header('Authorization') required String token,
    @Header('Accept-Language') required String lang,
  });

  @GET(EndPoints.aboutUsData)
  Future<AboutUsModel> aboutUsData({
    @Header('Authorization') required String token,
    @Header('Accept-Language') required String lang,
  });
}
