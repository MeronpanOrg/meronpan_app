import 'package:equatable/equatable.dart';

import '../utils/pair.dart';


enum triState { stateIgnore, stateInclude, stateExclude }

abstract class Filter<T> extends Equatable {
  final String name;
  final T state;

  const Filter({ this.name,  this.state});

  @override
  List<Object> get props => [name, state];
}

abstract class FilterTriState extends Filter<triState> {
  const FilterTriState({ String name,  triState state})
      : super(name: name, state: state);
}

abstract class FilterGroup<V> extends Filter<List<V>> {
  const FilterGroup({ String name,  List<V> state})
      : super(name: name, state: state);
}

abstract class FilterSelection<V> extends Filter<int> {
  final List<V> values;

  const FilterSelection(
      { String name,  this.values,  int state})
      : super(name: name, state: state);
}

abstract class PairSelection extends FilterSelection<Pair> {
  const PairSelection(
      { String name,  List<Pair> values,  int state})
      : super(name: name, values: values, state: state);

  String toUriPart() {
    return values[state].value;
  }

  String get getName => values[state].key;

  Pair get getPair => values[state];

  List<String> getKeys() {
    return values.map((e) => e.key).toList();
  }

  List<String> getValues() {
    return values.map((e) => e.value).toList();
  }
}

abstract class FilterSort<T, V> extends Filter<T> {
  final List<V> values;
  const FilterSort(
      { String name,  this.values,  T state})
      : super(name: name, state: state);
}
