import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  const HomeEvents();
}


class OnTabEvent extends HomeEvents {
  const OnTabEvent({
    required this.onTab,
  });

  final int onTab;

  @override
  List<Object> get props => [onTab];
}

class FetchDataEvent extends HomeEvents{
  @override
  List<Object> get props =>[];

}
