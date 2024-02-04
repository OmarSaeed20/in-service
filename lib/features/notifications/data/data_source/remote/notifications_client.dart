import 'package:dio/dio.dart';
import 'package:in_service/features/notifications/data/models/notification_model.dart';
import '/index.dart';

import 'package:retrofit/retrofit.dart';

part 'notifications_client.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class NotificationClient {
  factory NotificationClient(Dio dio, {String baseUrl}) = _NotificationClient;

  @GET(EndPoints.notifications)
  Future<NotificationModel> notifications({
    @Query("page") required int page,
    @Header("Authorization") required String token,
    @Header('x-lang') required String lang,
  });

  @POST(EndPoints.blockNotifications)
  Future<AuthenticationModel> blockNotification({
    @Header("Authorization") required String token,
    @Header('x-lang') required String lang,
  });

 
}
