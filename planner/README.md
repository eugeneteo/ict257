# Study planner

A spreadsheet that puts every chapter of both courses in the week it is
taught, and works out when to revise each one.

[`ict257-study-planner.xlsx`](ict257-study-planner.xlsx) is the planner.
GitHub cannot preview a spreadsheet, so download it and open it in Excel,
LibreOffice Calc, Numbers or Google Sheets.

## What you set

One cell. On the **Start here** sheet, put in the date of your week 1 class.
Every other date in the workbook follows from it, including the exam date and
the revision dates for the chapters. The 39 teaching chapters carry two
revision dates each. The two course prefaces carry none, and the two
comprehensive reviews carry one.

If you have already booked your exam, type that date over the one it works out
for you.

## What it does

Each chapter carries three dates. The class date is the week we teach it.
Revision 1 falls a week later. Revision 2 falls three weeks after that.

Three short passes beat one long one, and the gap between them is the point.
You have to work to recall the material, and that effort is what fixes it.

Mark **Status** and **Confidence** from the dropdowns as you go. A date that
has gone by with the work not done turns amber. A date falling in the next
seven days turns light blue. Then revise by weakness rather than in order, by
filtering Confidence to the two lowest ratings.

The **Practice** sheet tracks the 22 optional challenges in
[`practice.md`](../practice.md), and shows the week each one becomes possible.

## Where the schedule bends

Three weeks after the first revision falls past the exam for the week 11 and
week 12 chapters, so those second revisions are pulled back into revision week.
That squeeze lands on SELinux, storage, booting, troubleshooting, firewalls and
network file systems, which is the hardest material in the module. Start those
before the sheet tells you to.

The **Start here** sheet explains the rest of the reasoning.

## Rebuilding it

```bash
python3 planner/build.py
```

The script writes the spreadsheet from scratch, so any edit you make to the
`.xlsx` will be lost when you run it. Chapters and weeks follow
[`lessons.md`](../lessons.md).
