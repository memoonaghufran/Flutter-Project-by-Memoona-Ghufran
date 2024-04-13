import 'package:flutter/material.dart';

void main() {
  runApp(HospitalManagementApp());
}

class HospitalManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Start with a login page
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientsPage()),
                );
              },
              child: Text('View Patients'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorsPage()),
                );
              },
              child: Text('View Doctors'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentsPage()),
                );
              },
              child: Text('View Appointments'),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  List<Patient> patients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patients')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPatientPage(addPatient: _addPatient)),
                );
              },
              child: Text('Add Patient'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(patients[index].name),
                    subtitle: Text(patients[index].id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addPatient(Patient patient) {
    setState(() {
      patients.add(patient);
    });
  }
}

class AddPatientPage extends StatelessWidget {
  final Function(Patient) addPatient;

  AddPatientPage({required this.addPatient});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add Patient')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String id = idController.text;
                Patient newPatient = Patient(name: name, id: id);
                addPatient(newPatient);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  List<Doctor> doctors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctors')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDoctorPage(addDoctor: _addDoctor)),
                );
              },
              child: Text('Add Doctor'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(doctors[index].name),
                    subtitle: Text(doctors[index].id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addDoctor(Doctor doctor) {
    setState(() {
      doctors.add(doctor);
    });
  }
}

class AddDoctorPage extends StatelessWidget {
  final Function(Doctor) addDoctor;

  AddDoctorPage({required this.addDoctor});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add Doctor')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String id = idController.text;
                Doctor newDoctor = Doctor(name: name, id: id);
                addDoctor(newDoctor);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List<Appointment> appointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAppointmentPage(addAppointment: _addAppointment)),
                );
              },
              child: Text('Schedule Appointment'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(appointments[index].patientName),
                    subtitle: Text(appointments[index].doctorName),
                    trailing: Text(appointments[index].dateTime.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addAppointment(Appointment appointment) {
    setState(() {
      appointments.add(appointment);
    });
  }
}

class AddAppointmentPage extends StatelessWidget {
  final Function(Appointment) addAppointment;

  AddAppointmentPage({required this.addAppointment});

  @override
  Widget build(BuildContext context) {
    TextEditingController patientNameController = TextEditingController();
    TextEditingController doctorNameController = TextEditingController();
    TextEditingController dateTimeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Schedule Appointment')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: patientNameController,
              decoration: InputDecoration(labelText: 'Patient Name'),
            ),
            TextField(
              controller: doctorNameController,
              decoration: InputDecoration(labelText: 'Doctor Name'),
            ),
            TextField(
              controller: dateTimeController,
              decoration: InputDecoration(labelText: 'Date and Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String patientName = patientNameController.text;
                String doctorName = doctorNameController.text;
                DateTime dateTime = DateTime.parse(dateTimeController.text);
                Appointment newAppointment = Appointment(patientName: patientName, doctorName: doctorName, dateTime: dateTime);
                addAppointment(newAppointment);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class Patient {
  final String name;
  final String id;

  Patient({required this.name, required this.id});
}

class Doctor {
  final String name;
  final String id;

  Doctor({required this.name, required this.id});
}

class Appointment {
  final String patientName;
  final String doctorName;
  final DateTime dateTime;

  Appointment({required this.patientName, required this.doctorName, required this.dateTime});
}
