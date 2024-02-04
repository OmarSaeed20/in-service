import '/index.dart';

part 'home_entity.g.dart';

@JsonSerializable(createToJson: false)
class HomeEntity extends Equatable {
  @JsonKey(name: "Banners")
  final List<String> banners;
  @JsonKey(name: "count-unread")
  final int countUnread;

  const HomeEntity({
    required this.banners, 
    required this.countUnread,
  });
  factory HomeEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeEntityFromJson(json);
  @override
  List<Object> get props => [countUnread, banners ];
}
