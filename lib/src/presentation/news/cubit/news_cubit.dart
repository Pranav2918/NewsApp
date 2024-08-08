import 'package:cubitdemo/src/domain/network_service/app_repository.dart';
import 'package:cubitdemo/src/presentation/news/cubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsAPIState> {
  final AppRepository appRepository;
  NewsCubit(this.appRepository) : super(NewsAPIInitial());

  Future<void> fetchData() async {
    try {
      emit(NewsAPILoading());
      final newsData = await appRepository.fetchNews();
      emit(NewsAPILoaded(newsData));
    } catch (e) {
      emit(NewsAPIFailed("Failed to fetch news $e"));
    }
  }
}
