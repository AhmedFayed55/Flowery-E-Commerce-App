sealed class SearchEvent {}

class GoToSearchEvent extends SearchEvent {
  String keyword;

  GoToSearchEvent({required this.keyword});
}

class SearchDelayedEvent extends SearchEvent {
  String keyword;

  SearchDelayedEvent({required this.keyword});
}

class ClearSearchEvent extends SearchEvent {
  String keyword;

  ClearSearchEvent({required this.keyword});
}
