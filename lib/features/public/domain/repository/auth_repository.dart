import '/index.dart';

abstract class BaseAuthenticationRepository {
  ResultFuture<AuthenticationModel> login(LoginParameter parameters);
  ResultFuture<AuthenticationModel> anonymous();
  ResultFuture<TokenModel> loginRefresh( TokenEntity parameters);
  ResultFuture<TokenVerifyModel> tokenVerify( StringOnlyParameter parameters);
  ResultFuture<AuthenticationModel> register(RegisterParameter parameters);
  ResultFuture<String> verifyCodeRegister(VerifyParameter params);
  ResultFuture<String> resendCodeRegister(IdOnlyParameter parameter);
  // Reset Password
  ResultFuture<String> setEmailAddress(ForgotPasswordParameter params);
  ResultFuture<String> verifyEmailAddress(ForgotPasswordParameter params);
  ResultFuture<String> resetPassword(ForgotPasswordParameter params);
  ResultFuture<void> contactUs(ContactUsParameter params);
  ResultFuture<void> updatePassword(ForgotPasswordParameter params);
  ResultFuture<AuthenticationModel> updateProfile(
    UpdateProfileParameter params,
  );
  ResultFuture<AuthenticationModel> getUserData();

  ResultFuture<AboutUsModel> aboutUs();
}
