class Seat {
  final String id;
  final String row;
  final int number;
  bool isSelected;
  bool isOccupied;

  Seat({required this.id, required this.row, required this.number, this.isSelected = false, this.isOccupied = false});
}

List<Seat> seats = [

];
