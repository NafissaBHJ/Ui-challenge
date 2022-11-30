class Event {
  int? id;
  String title;
  String description;
  List<Schedule>? schedule;
  List<Rating> rate;
  Event(
      {required this.title,
      required this.description,
      required this.schedule,
      required this.rate});
  //  types : 0 breaks and openings, 1 : talks, 2 workshops,
  //  status  0 : ok 1: cancelled
  static List<Event> eventsList = [
    Event(
        title: "EVENT TWO",
        description:
            " The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy",
        schedule: [
          Schedule(
              title: "Opening ceremoney",
              date: "nov 30",
              time: "08:30 AM",
              status: 0,
              type: 0),
          Schedule(
              title: "Talk N° 01",
              date: "nov 30",
              time: "09:00 AM",
              status: 0,
              type: 1),
          Schedule(
              title: "Workshop ",
              date: "nov 30",
              time: "09:30 AM",
              status: 0,
              type: 1),
          Schedule(
              title: "Lunch break",
              date: "nov 30",
              time: "12:00 PM",
              status: 0,
              type: 0),
          Schedule(
              title: "Talk N° 03",
              date: "nov 30",
              time: "13:00 PM",
              status: 1,
              type: 1),
          Schedule(
              title: "Workshop",
              date: "nov 30",
              time: "14:30 PM",
              status: 0,
              type: 0),
        ],
        rate: []),
    Event(
        title: "EVENT THREE",
        description:
            " This is some dummy text. This is some dummy text. This is some dummy text. This is some dummy text. This is some dummy text. This is some dummy text. This is some dummy text. This is some dummy text. This is some dummy text. This is some dummy text.",
        schedule: [
          Schedule(
              title: "Opening ceremoney",
              date: "nov 30",
              time: "08:30 AM",
              status: 0,
              type: 0),
          Schedule(
              title: "Workshop 1",
              date: "nov 30",
              time: "10:30 AM",
              status: 0,
              type: 1),
          Schedule(
              title: "LUNCH BREAK",
              date: "nov 30",
              time: "12:30 PM",
              status: 0,
              type: 0),
          Schedule(
              title: "Talk 2 (CANCELLED) ",
              date: "nov 30",
              time: "13:30 PM",
              status: 1,
              type: 1),
          Schedule(
              title: "Closing Ceremoney",
              date: "nov 30",
              time: "16:30 PM",
              status: 0,
              type: 0),
        ],
        rate: []),
  ];

  static Event currentEvent = Event(
      title: "EVENT ONE",
      description:
          " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
      schedule: [
        Schedule(
            title: "Opening ceremoney",
            date: "nov 29",
            time: "08:30 AM",
            status: 0,
            type: 0),
        Schedule(
            title: "Talk N°01 ",
            date: "nov 29",
            time: "09:30 AM",
            status: 0,
            type: 0),
        Schedule(
            title: "Workshop",
            date: "nov 29",
            time: "10:00 AM",
            status: 0,
            type: 0),
        Schedule(
            title: "Closing ceremony",
            date: "nov 29",
            time: "12:00 PM",
            status: 0,
            type: 0),
      ],
      rate: []);
}

class Schedule {
  String title;
  String date;
  String time;
  int status;
  int type;
  Schedule(
      {required this.title,
      required this.date,
      required this.time,
      required this.status,
      required this.type});
}

class Rating {
  String? user;
  String? comment;
  int rate;

  Rating({this.user, required this.rate, this.comment});
}
