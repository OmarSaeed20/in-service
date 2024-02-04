// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) => HomeEntity(
      banners:
          (json['Banners'] as List<dynamic>).map((e) => e as String).toList(),
      countUnread: json['count-unread'] as int,
    );
