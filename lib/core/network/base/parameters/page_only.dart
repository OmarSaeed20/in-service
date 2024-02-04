import '/index.dart';

class PageOnlyParameter extends Equatable {
  final int page;

  const PageOnlyParameter({required this.page});
  Map<String, dynamic> toJson() => {'page': page};

  @override
  List<Object> get props => [page];
}
