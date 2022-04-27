import 'package:bloc/bloc.dart';
import '../../../entity/models.dart';
import '../../../entity/repos/visited_repository.dart';
import 'package:equatable/equatable.dart';

part 'visited_state.dart';

class VisitedCubit extends Cubit<VisitedState> {
  final VisitedRepository visitedRepository;
  VisitedCubit(this.visitedRepository) : super(VisitedInitial());

  void getVisited() {
    visitedRepository.visited().then((visitedObj) {
      emit(VisitedLoaded(visitedObj));
    });
  }
}
