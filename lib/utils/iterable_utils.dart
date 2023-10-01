extension IterableUtils<T> on Iterable<T> {
  T? get mostFrequent {
    final frequencyMap = <T, int>{};

    forEach((element) {
      frequencyMap.update(element, (value) => value + 1, ifAbsent: () => 1);
    });

    var mostFrequentElement = frequencyMap.keys.firstOrNull;
    var highestFrequency = frequencyMap.values.firstOrNull ?? 0;

    frequencyMap.forEach((element, frequency) {
      if (frequency > highestFrequency) {
        mostFrequentElement = element;
        highestFrequency = frequency;
      }
    });

    return mostFrequentElement;
  }
}
