class CallData {
  final String name;
  final String number;
  final String discription;

  CallData({
    this.name,
    this.number,
    this.discription,
  });

  static List<CallData> _callinfo = [
    CallData(
      name: "1990",
      number: "1990",
      discription: "Ambulance Service For Emergencies",
    ),
    CallData(
      name: "1999",
      number: "1999",
      discription: "Health Information",
    ),
    CallData(
      name: "117",
      number: "117",
      discription: "Covid-19 Related Complaints",
    ),
  ];

  static List get callInfomation {
    return _callinfo;
  }
}
