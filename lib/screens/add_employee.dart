import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicaltest/screens/constants.dart';
import 'package:practicaltest/services/employee_service.dart';

class AddEmployeePage extends StatefulWidget {
  final Map? employee;
  const AddEmployeePage({
    super.key,
    this.employee,
  });

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  TextEditingController empnoController = TextEditingController();
  TextEditingController empnameController = TextEditingController();
  TextEditingController addressline1Controller = TextEditingController();
  TextEditingController addressline2Controller = TextEditingController();
  TextEditingController addressline3Controller = TextEditingController();
  TextEditingController departmentcodeController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController basicsalaryController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final employee = widget.employee;
    if (employee != null) {
      isEdit = true;
      final empNo = employee['empNo'];
      final empName = employee['empName'];
      final empAddressLine1 = employee['empAddressLine1'];
      final empAddressLine2 = employee['empAddressLine2'];
      final empAddressLine3 = employee['empAddressLine3'];
      final departmentCode = employee['departmentCode'];
      final dateOfBirth = employee['dateOfBirth'];
      final basicSalary = employee['basicSalary'];
      empnoController.text = empNo;
      empnameController.text = empName;
      addressline1Controller.text = empAddressLine1;
      addressline2Controller.text = empAddressLine2;
      addressline3Controller.text = empAddressLine3;
      departmentcodeController.text = departmentCode;
      dateofbirthController.text = dateOfBirth;
      basicsalaryController.text = basicSalary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? 'Edit Employee' : 'Add Employee'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
                controller: empnoController,
                decoration: const InputDecoration(
                    hintText: 'EmpNo :', hintStyle: kTextWordColor)),
            const SizedBox(
              height: 5,
            ),
            TextField(
                controller: empnameController,
                decoration: const InputDecoration(
                    hintText: 'Emp Name :', hintStyle: kTextWordColor)),
            const SizedBox(
              height: 5,
            ),
            TextField(
                controller: addressline1Controller,
                decoration: const InputDecoration(
                    hintText: 'Emp Address Line 1 :',
                    hintStyle: kTextWordColor)),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
                controller: addressline2Controller,
                decoration: const InputDecoration(
                    hintText: 'Emp Address Line 2 :',
                    hintStyle: kTextWordColor)),
            const SizedBox(
              height: 5,
            ),
            TextField(
                controller: addressline3Controller,
                decoration: const InputDecoration(
                    hintText: 'Emp Address Line 3 :',
                    hintStyle: kTextWordColor)),
            const SizedBox(
              height: 5,
            ),
            TextField(
                controller: departmentcodeController,
                decoration: const InputDecoration(
                    hintText: 'Department Code :', hintStyle: kTextWordColor)),
            const SizedBox(
              height: 5,
            ),
            TextField(
                controller: dateofbirthController,
                decoration: const InputDecoration(
                    hintText: 'Date of Birth :', hintStyle: kTextWordColor)),
            const SizedBox(
              height: 5,
            ),
            TextField(
                controller: basicsalaryController,
                decoration: const InputDecoration(
                    hintText: 'Basic Salary :', hintStyle: kTextWordColor)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: isEdit ? updateData : submitData,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(isEdit ? 'Update' : 'Submit'),
                ))
          ],
        ));
  }

  Future<void> updateData() async {
    final employee = widget.employee;
    if (employee == null) {
      print("You can not call updated without employee data.");
      return;
    }
    final id = employee['_id'];
    // final isCompleted = employee['is_completed'];
    final empNo = empnoController.text;
    final empName = empnameController.text;
    final empAddressLine1 = addressline1Controller.text;
    final empAddressLine2 = addressline2Controller.text;
    final empAddressLine3 = addressline3Controller.text;
    final departmentCode = departmentcodeController.text;
    final dateOfBirth = dateofbirthController.text;
    final basicSalary = basicsalaryController.text;
    final body = {
      "empNo": empNo,
      "empName": empName,
      "empAddressLine1": empAddressLine1,
      "empAddressLine2": empAddressLine2,
      "empAddressLine3": empAddressLine3,
      "departmentCode": departmentCode,
      "dateOfBirth": dateOfBirth,
      "basicSalary": basicSalary,
      "isActive": true
    };

    //Submitdata to the server
    final url = 'http://examination.24x7retail.com/api/v1.0/Employee';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'applications/json',
        "X-CMC_PRO_API_KEY": "?D(G+KbPeSgVkYp3s6v9y+B&E)H@McQf",
      },
    );

    //Show success or Fail Message
    if (response.statusCode == 200) {
      showSuccessMessage("Updation Success");
    } else {
      showErrorMessage("Updation Failed");
    }
  }

  Future<void> submitData() async {
    //Get the data from form
    final empNo = empnoController.text;
    final empName = empnameController.text;
    final empAddressLine1 = addressline1Controller.text;
    final empAddressLine2 = addressline2Controller.text;
    final empAddressLine3 = addressline3Controller.text;
    final departmentCode = departmentcodeController.text;
    final dateOfBirth = dateofbirthController.text;
    final basicSalary = basicsalaryController.text;
    final body = {
      "empNo": empNo,
      "empName": empName,
      "empAddressLine1": empAddressLine1,
      "empAddressLine2": empAddressLine2,
      "empAddressLine3": empAddressLine3,
      "departmentCode": departmentCode,
      "dateOfBirth": dateOfBirth,
      "basicSalary": basicSalary,
      "isActive": true
    };

    //Submitdata to the server
    final url = 'http://examination.24x7retail.com/api/v1.0/Employee';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'applications/json',
        "X-CMC_PRO_API_KEY": "?D(G+KbPeSgVkYp3s6v9y+B&E)H@McQf",
      },
    );

    //Submitdata to the server
    final isSuccess = await EmployeeService.addEmployee(body);
    //Show success or Fail Message
    if (isSuccess) {
      empnoController.text = '';
      empnameController.text = '';
      addressline1Controller.text = '';
      addressline2Controller.text = '';
      addressline3Controller.text = '';
      departmentcodeController.text = '';
      dateofbirthController.text = '';
      dateofbirthController.text = '';
      basicsalaryController.text = '';
      showSuccessMessage("Creation Success");
    } else {
      print('Error');
      showErrorMessage("Creation Failed");
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
