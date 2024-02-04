
import '/index.dart';

class AuthenticationRepositoryImp implements BaseAuthenticationRepository {
  AuthenticationRepositoryImp(
    this._authApiClient,
    this._preferences,
  );
  final AuthClient _authApiClient;
  final AppPreferences _preferences;
  @override
  ResultFuture<TokenModel> loginRefresh(TokenEntity parameters) async =>
      executAndHandelError<TokenModel>(
        () => _authApiClient.loginRefresh(
          refresh: parameters.token,
          lang: Get.find<AppPreferences>().getLang,
        ),
      );

  @override
  ResultFuture<TokenVerifyModel> tokenVerify(
      StringOnlyParameter parameters) async {
    try {
      var result = await _authApiClient.tokenVerify(
        token: parameters.inputData,
        lang: Get.find<AppPreferences>().getLang,
      );
      debugPrint("Future.value >>>>> true");
      return ApiResult.success(result);
    } catch (e) {
      debugPrint("Future.value false");
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  @override
  ResultFuture<AuthenticationModel> anonymous() async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.anonymous(
          lang: Get.find<AppPreferences>().getLang,
        ),
      );
  @override
  ResultFuture<AuthenticationModel> login(LoginParameter parameter) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.login(
          phone: parameter.email,
          password: parameter.password,
          lang: Get.find<AppPreferences>().getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> register(
    RegisterParameter parameter,
  ) async =>
      executAndHandelError<AuthenticationModel>(
        () => _authApiClient.register(
          parameters: parameter,
          lang: Get.find<AppPreferences>().getLang,
        ),
      );

  @override
  ResultFuture<String> verifyCodeRegister(
    VerifyParameter params,
  ) async =>
      executAndHandelError<String>(
        () => _authApiClient.verifyCodeRegister(
          id: params.id,
          code: params.code,
          lang: _preferences.getLang.valide(),
        ),
      );

  @override
  ResultFuture<String> resendCodeRegister(
    IdOnlyParameter parameter,
  ) async =>
      executAndHandelError<String>(
        () => _authApiClient.resendCodeRegister(
          id: parameter.id,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<String> setEmailAddress(
    ForgotPasswordParameter params,
  ) async =>
      executAndHandelError<String>(
        () => _authApiClient.setEmailAddress(
          email: params.email!,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<String> verifyEmailAddress(
    ForgotPasswordParameter params,
  ) async =>
      executAndHandelError<String>(
        () => _authApiClient.verifyEmailAddress(
          email: params.email!,
          code: params.code!,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<String> resetPassword(ForgotPasswordParameter params) async =>
      executAndHandelError<String>(
        () => _authApiClient.resetPassword(
          email: params.email!,
          code: params.code!,
          password: params.password!,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<void> contactUs(ContactUsParameter params) async =>
      executAndHandelError<void>(
        () => _authApiClient.contactUs(
          message: params.content,
          lang: _preferences.getLang,
          token: _preferences.getToken.valide(),
        ),
      );

  @override
  ResultFuture<void> updatePassword(ForgotPasswordParameter params) async =>
      executAndHandelError<void>(
        () async => _authApiClient.updatePassword(
          id:  0,
          lang: _preferences.getLang,
          password: params.password!,
          passwordConfirm: params.password!,
          token: _preferences.getToken.valide(),
        ),
      );

  @override
  ResultFuture<AuthenticationModel> getUserData() async =>
      executAndHandelError<AuthenticationModel>(
        () async => _authApiClient.getUserData(
          token: _preferences.getToken.valide(),
          id: 0,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<AuthenticationModel> updateProfile(
    UpdateProfileParameter parameter,
  ) async =>
      executAndHandelError<AuthenticationModel>(
        () async => _authApiClient.updateProfile(
          id: 0,
          name: parameter.name,
          lang: _preferences.getLang,
          codeCountry: parameter.codeCountry,
          mobile: parameter.phone,
          image: parameter.image,
          token: _preferences.getToken.valide(),
        ),
      );

  @override
  ResultFuture<AboutUsModel> aboutUs() async =>
      executAndHandelError<AboutUsModel>(
        () => _authApiClient.aboutUsData(
          token: _preferences.getToken.valide(),
          lang: _preferences.getLang,
        ),
      );
}
