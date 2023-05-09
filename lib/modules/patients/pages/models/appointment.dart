import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/modules/family/models/family.dart';
import 'package:doctor/modules/patients/controller/appointment_controller.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:hive/hive.dart';
part 'appointment.g.dart';

@HiveType(typeId: 14)
class Appointment extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late DateTime startingTime = DateTime.now();
  @HiveField(2)
  late int duration = 1;
  @HiveField(3)
  late String problem;
  @HiveField(4)
  late Family member = Family();
  @HiveField(5)
  late String status;
  @HiveField(6)
  late Package package;
  @HiveField(7)
  late User patient;
  @HiveField(8)
  late User doctor = User();
  @HiveField(9)
  late DateTime createdAt;

  late String rescheduleProblem;
  Appointment();

  void localizeInfo() {
    var box = Boxes.getAppointments();
    box.add(this);
  }

  void addAppointment() {
    AppointmentController().addAppointment(this);
  }

  void cancelAppointment() {
    AppointmentController().cancelAppointment(this);
  }

  void rescheduleAppointment() {
    AppointmentController().rescheduleAppointment(this);
  }

  Appointment.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    status = json['status'];
    duration = json['duration'];
    problem = json['problem'];
    startingTime = DateTime.parse(json['startingTime']);
    member = Family.fromJson(json['FamilyMember']);
    patient = User.fromDocumentSnapshot(json['User']);
    package = Package.fromJson(json['Package']);
    createdAt = DateTime.parse(json['createdAt']);
  }
}
