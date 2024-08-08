import 'package:cubitdemo/src/data/news_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsAPIState extends Equatable {
  const NewsAPIState();

  @override
  List<Object> get props => [];
}

class NewsAPIInitial extends NewsAPIState {}

class NewsAPILoading extends NewsAPIState {}

class NewsAPILoaded extends NewsAPIState {
  final News news;
  const NewsAPILoaded(this.news);

  @override
  List<Object> get props => [news];
}

class NewsAPIFailed extends NewsAPIState {
  final String errorMessage;
  const NewsAPIFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
