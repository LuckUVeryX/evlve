extension IterableUtils<T> on Iterable<T> {
  T get mostFrequent {
    final frequencyMap = <T, int>{};

    forEach((element) {
      frequencyMap.update(element, (value) => value + 1, ifAbsent: () => 1);
    });

    var mostFrequentElement = frequencyMap.keys.first;
    var highestFrequency = frequencyMap.values.first;

    frequencyMap.forEach((element, frequency) {
      if (frequency > highestFrequency) {
        mostFrequentElement = element;
        highestFrequency = frequency;
      }
    });

    return mostFrequentElement;
  }
}
