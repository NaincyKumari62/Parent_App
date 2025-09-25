import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../button/small_rounded_button.dart';

class AttendanceTable extends StatelessWidget {
  const AttendanceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade200,
          ),
          columnSpacing: 5,
          dataRowMinHeight: 50,
          dataRowMaxHeight: 60,
          columns: [
            const DataColumn(label: Text("Date")),
            _verticalDividerColumn(),
            const DataColumn(label: Text("Status")),
            _verticalDividerColumn(),
            const DataColumn(label: Text("Check In")),
            _verticalDividerColumn(),
            const DataColumn(label: Text("Check Out")),
            _verticalDividerColumn(),
            const DataColumn(label: Text("Duration")),
          ],
          rows: [
            _buildRow("02/09/25", "Present", "08:30", "08:32", "14:30", "14:28", "06:00", Colors.green),
            _buildRow("01/09/25", "Present", "08:30", "08:30", "14:30", "14:30", "06:00", Colors.green),
            _buildRow("31/08/25", "Weekend", "08:30", "08:32", "14:30", "14:28", "06:00", Colors.orange),
            _buildRow("30/08/25", "Leave", "08:30", "08:32", "14:30", "14:28", "06:00", Colors.red),
            _buildRow("29/08/25", "Absent", "08:30", "08:32", "14:30", "14:28", "06:00", Colors.red),
          ],
        ),
      ),
    );
  }

  static DataColumn _verticalDividerColumn() {
    return DataColumn(
      label: Container(
        height: 40,
        width: 1,
        color: Colors.grey.shade300,
      ),
    );
  }

  static  _buildRow(
      String date,
      String status,
      String scheduledCheckIn,
      String actualCheckIn,
      String scheduledCheckOut,
      String actualCheckOut,
      String duration,
      Color color,
      ) {
    return DataRow(
      cells: [
        DataCell(Text(date, style: _cellTextStyle())),
        _verticalDividerCell(),
        DataCell(_buildStatusCell(status, color)),
        _verticalDividerCell(),
        DataCell(_buildTimeCell(scheduledCheckIn, actualCheckIn)),
        _verticalDividerCell(),
        DataCell(_buildTimeCell(scheduledCheckOut, actualCheckOut)),
        _verticalDividerCell(),
        DataCell(Center(child: Text(duration, style: _cellTextStyle()))),
      ],
    );
  }

  static DataCell _verticalDividerCell() {
    return DataCell(
      Container(
        width: 1,
        height: double.infinity,
        color: Colors.grey.shade300,
      ),
    );
  }

  static Widget _buildStatusCell(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: SmallRoundedButton(
        cHeight: 23.h,
        cWidth: double.infinity,
        btnName: status,
        bgColor: color,
        textFont: 12.sp,
        radius: 5.r,
        onPressed: (){},
      ),
    );
  }

  static Widget _buildTimeCell(String scheduled, String actual) {
    if (scheduled == "-" || actual == "-") {
      return Text("-", style: _cellTextStyle());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(scheduled, style: _cellTextStyle()),
        SizedBox(height: 5.h,),
         Container(
           height: 1,
           width:double.infinity,
           color: Colors.grey.shade300,
         ),
       SizedBox(height: 5.h,),
          Text(
            actual,
            style: _cellTextStyle()
          ),
      ],
    );
  }

  static TextStyle _cellTextStyle() {
    return const TextStyle(fontSize: 12, height: 1.2);
  }
}
