import 'dart:io';
void main()
{
  performTabs();
}

void performTabs() async
{
  task1();
 String task2results = await task2();
  task3(task2results);
}


void task1()
{
  print('Task 1 done');
}

  Future task2() async {
  Duration times = Duration(seconds: 3);
  String result;
  await Future.delayed(times, (){
     result = "task 2 data";
    print('Task 2 done');
  });
  return result;
}

void task3(String data)
{
  print('Task 3 done $data');
}