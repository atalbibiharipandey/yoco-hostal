import 'package:flutter_application_1/core/common.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyRangeCalender extends StatefulWidget {
  const MyRangeCalender({
    super.key,
    this.onChanged,
    this.selectedRangeStart,
    this.selectedRangeEnd,
    this.rangeSelectionMode,
  });
  final Function(DateTime start, DateTime end)? onChanged;
  final DateTime? selectedRangeStart;
  final DateTime? selectedRangeEnd;
  final bool? rangeSelectionMode;
  @override
  State<MyRangeCalender> createState() => _MyRangeCalenderState();
}

class _MyRangeCalenderState extends State<MyRangeCalender> {
  ValueNotifier<List<String>> calendarHeaderValue = ValueNotifier([
    DateFormat("MMMM").format(DateTime.now()),
    DateTime.now().year.toString()
  ]);
  PageController? pageController;
  DateTime cDay = DateTime.now();
  DateTime? selectDate = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    if (!isSameDay(selectDate, selectDay)) {
      setState(() {
        selectDate = selectDay;
        cDay = focusDay;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(selectDay, selectDay);
      }
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime? focusDay) {
    selectDate = null;
    cDay = focusDay ?? DateTime.now();
    rangeStart = start;
    rangeEnd = end;
    // print("Start Day:= ${start?.day}, End Day:= ${end?.day}");
    setState(() {});
    if (start != null && end != null && widget.onChanged != null) {
      widget.onChanged!(start, end);
    }
  }

  headerMonthDataAssign() {
    List<String> tmp = [];
    tmp.add(DateFormat("MMMM").format(cDay));
    tmp.add(cDay.year.toString());
    calendarHeaderValue.value = tmp;
  }

  @override
  void dispose() {
    calendarHeaderValue.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    rangeStart = widget.selectedRangeStart;
    rangeEnd = widget.selectedRangeEnd;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AnimatedBuilder(
              animation: calendarHeaderValue,
              builder: (context, ch) {
                print("Refreshed:========");
                return InkWell(
                  onTap: () async {
                    // calendar.displayDate = cDay;
                    // final t = await MyDialogUtils.showDialoge(
                    //     YearMonthWheelPicker(
                    //         calendar: calendar,
                    //         setHeaderFunction: headerMonthDataAssign));
                    // print(t);
                    // cDay = calendar.displayDate!;
                    // headerMonthDataAssign();
                    // setState(() {});
                  },
                  child: Row(children: [
                    Text(
                      calendarHeaderValue.value.first,
                      style: textBoldw700.fntSize(18).fntColor(cPrimery),
                    ),
                    wsBox05,
                    Text(
                      calendarHeaderValue.value.last,
                      style: textBoldw700.fntSize(18).fntColor(cPrimery),
                    ),
                    wsBox05,
                    Image.asset(
                      image.imgeEdit,
                      width: k20,
                      height: k20,
                    )
                  ]),
                );
              })
        ]),
        hsBox10,
        TableCalendar(
          focusedDay: cDay,
          firstDay: DateTime(cDay.year - 3),
          lastDay: DateTime(cDay.year + 3),
          weekNumbersVisible: false,
          currentDay: cDay,
          headerVisible: false,
          selectedDayPredicate: (day) => isSameDay(day, selectDate),
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: onDaySelected,
          rangeStartDay: rangeStart,
          rangeEndDay: rangeEnd,
          onRangeSelected: onRangeSelected,
          onHeaderTapped: (focusedDay) {
            print(focusedDay);
          },
          onHeaderLongPressed: (focusedDay) {},
          calendarStyle: CalendarStyle(
            rangeHighlightColor: cPrimery.withOpacity(0.3),
            isTodayHighlighted: true,
            markerDecoration:
                BoxDecoration(color: cPrimery, shape: BoxShape.circle),
            selectedDecoration:
                BoxDecoration(color: cBlueText, shape: BoxShape.circle),
            todayDecoration:
                BoxDecoration(color: cPrimery, shape: BoxShape.circle),
            rangeEndDecoration:
                BoxDecoration(color: cPrimery, shape: BoxShape.circle),
            rangeStartDecoration:
                BoxDecoration(color: cPrimery, shape: BoxShape.circle),
            holidayTextStyle: TextStyle(color: cred),
            holidayDecoration: BoxDecoration(shape: BoxShape.circle),
          ),
          rangeSelectionMode: widget.rangeSelectionMode ?? false
              ? RangeSelectionMode.toggledOn
              : RangeSelectionMode.disabled,
          onPageChanged: (focusedDay) {
            cDay = focusedDay;
            headerMonthDataAssign();
          },
          pageJumpingEnabled: true,
          onCalendarCreated: (pageCnt) {
            print("Page created.....");
            pageController = pageCnt;
          },
          holidayPredicate: (day) {
            // print("Holiday:= ${day.day} and WeekDay:= ${day.weekday}");
            if (day.weekday == 6 || day.weekday == 7) {
              return true;
            }
            return false;
          },
        ),
      ],
    );
  }
}
