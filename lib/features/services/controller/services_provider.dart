import 'package:intl/intl.dart';
import 'package:younified/utils/exports/common_exports.dart';

class ServicesProvider extends ChangeNotifier {
  //SERVICE LIST
  static final List<Map<String, String>> servicesList = [
    {
      "image": AppIcons.voting,
      "title": "Voting",
      "subtitle": "Enter to see active \nelections and vote."
    },
    {
      "image": AppIcons.call,
      "title": "Click to call",
      "subtitle": "Enter to see active \nelections and vote."
    },
  ];

  //MAPPING
  static final List<HomeListModel> servicesListData = servicesList
    .map((mapData) => HomeListModel.fromMap(mapData))
    .toList();

  // VOTING LIST
  static final List<Map<String, dynamic>> votingList = [
    {
      "election_name": "Election 1",
      "ends_in_days": 12,
      "end_date": "2023-11-04",
      "receipt_id": "OCB5E",
      "voting_open": true  // If true, "Vote" button is shown
    },
    {
      "election_name": "Election 2",
      "ends_in_days": 12,
      "end_date": "2023-11-04",
      "receipt_id": "ABC123",
      "voting_open": true
    },
    {
      "election_name": "Election 3",
      "ends_in_days": 12,
      "end_date": "2023-11-04",
      "receipt_id": "XYZ456",
      "voting_open": false  // If false, "Vote" button is hidden
    }
  ];


  //MAPPING
  static final List<VotingModel> votingListData = votingList
    .map((mapData) => VotingModel.fromJson(mapData))
    .toList();

  
  // CALLING LIST
  static final List<Map<String, String>> callingList = [
  {
    "calling_title": "Meeting with Client",
    "start_date": "2024-10-14",
    "end_date": "2024-10-14",
    "phone_number": "+1234567890"
  },
  {
    "calling_title": "Project Update Call",
    "start_date": "2024-10-15",
    "end_date": "2024-10-15",
    "phone_number": "+0987654321"
  },
  {
    "calling_title": "Team Standup",
    "start_date": "2024-10-16",
    "end_date": "2024-10-16",
    "phone_number": "+1122334455"
  },
  {
    "calling_title": "Vendor Discussion",
    "start_date": "2024-10-17",
    "end_date": "2024-10-17",
    "phone_number": "+1230984567"
  },
  {
    "calling_title": "Marketing Strategy Call",
    "start_date": "2024-10-18",
    "end_date": "2024-10-18",
    "phone_number": "+1444555666"
  },
  {
    "calling_title": "HR Interview",
    "start_date": "2024-10-19",
    "end_date": "2024-10-19",
    "phone_number": "+1666777888"
  },
  {
    "calling_title": "Sales Team Sync",
    "start_date": "2024-10-20",
    "end_date": "2024-10-20",
    "phone_number": "+1222333444"
  },
  {
    "calling_title": "Product Launch Call",
    "start_date": "2024-10-21",
    "end_date": "2024-10-21",
    "phone_number": "+1888999000"
  },
  {
    "calling_title": "Customer Feedback Session",
    "start_date": "2024-10-22",
    "end_date": "2024-10-22",
    "phone_number": "+1999111222"
  },
  {
    "calling_title": "Technical Support Discussion",
    "start_date": "2024-10-23",
    "end_date": "2024-10-23",
    "phone_number": "+1555666777"
  }
];

//MAPPING
  static final List<CallingModel> callingListData = callingList
    .map((mapData) => CallingModel.fromJson(mapData))
    .toList();


  // DATE FORMATING
  String formatDateString(String dateString) {
  // Parse the input date string
  DateTime parsedDate = DateTime.parse(dateString);

  // Format the date into the required format
  String daySuffix = getDaySuffix(parsedDate.day);  // Get the day suffix (e.g., "th", "st", etc.)
  String formattedDate = "${DateFormat("MMMM d").format(parsedDate)}$daySuffix ${DateFormat("y").format(parsedDate)}";

  return formattedDate;
}

// Function to get the correct suffix for the day (st, nd, rd, th)
String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return "th";
  }
  switch (day % 10) {
    case 1:
      return "st";
    case 2:
      return "nd";
    case 3:
      return "rd";
    default:
      return "th";
  }
}

}