class Days {
  final List<Hours> selectedHours;
  bool isSelected;
  final String name;
  bool currentIndex;

  Days(
      {required this.selectedHours,
      required this.isSelected,
      required this.name,
      required this.currentIndex});
}

class Hours {
  final String name;
  bool isSelected;
  Hours({required this.isSelected, required this.name});
}