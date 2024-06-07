import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
//메인페이지 피드
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Text('UniClub'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SpaceReservationPage()),
                  );
                },
                child: Column(
                  children: [
                    Icon(Icons.event_seat),
                    Text('공간예약'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Icon(Icons.campaign),
                    Text('홍보'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          buildClubPost('Residential Coleege', '오늘은 하늘의 10번째 정기공연 입니다...', 36,'C:/Users/tjxod/my_flutter_app/동아리 공연.png'),
          buildClubPost('생생수다', '저희 공연 사진입니다...', 12,'C:/Users/tjxod/my_flutter_app/동아리 공연2.png'),
          buildClubPost('Uniclub', '저희 공연 보러오세요...', 24,'C:/Users/tjxod/my_flutter_app/동아리 공연2.png')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CalendarPage()),
            );
          } else if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
      ),
    );
  }



  Widget buildClubPost(String clubName, String content, int likes,image_path) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.group),
                ),
                SizedBox(width: 8),
                Text(clubName),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 8),
            Image.asset(
              image_path, // 이미지 경로
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(content),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                Text('$likes'),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//공간예약 코드
}class SpaceReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text('UniClub'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '어떤 공간을 찾으시나요?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.group, size: 50),
                    Text('총회의실'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.music_note, size: 50),
                    Text('악기 연습실'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.cancel, size: 50),
                    Text('댄스 연습실'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                children: List.generate(4, (index) {
                  String imagePath;
                  switch (index) {
                    case 0:
                      imagePath = 'C:/Users/tjxod/my_flutter_app/회의실1.png';
                      break;
                    case 1:
                      imagePath = 'C:/Users/tjxod/my_flutter_app/회의실2.png';
                      break;
                    case 2:
                      imagePath = 'C:/Users/tjxod/my_flutter_app/회의실3.png';
                      break;
                    case 3:
                      imagePath = 'C:/Users/tjxod/my_flutter_app/회의실4.png';
                      break;
                    default:
                      imagePath = 'C:/Users/tjxod/my_flutter_app/회의실1.png';
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            roomNumber: index,
                            imagePath: imagePath,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          ListTile(
                            title: Text('학생회관 1층 000$index'),
                            subtitle: Text('17:30 - 18:30'),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
//공간예약 세부 페이지
class DetailPage extends StatelessWidget {
  final int roomNumber;
  final String imagePath;

  DetailPage({required this.roomNumber, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('학생회관 1층 000$roomNumber'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(height: 16),
            Text(
              '학생회관 1층 000$roomNumber',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('이곳은 다양한 용도로 사용할 수 있는 공간입니다.'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.music_note, size: 50),
                    Text('악기 연습실'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.warning, size: 50, color: Colors.red),
                    Text('사용 중'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.school, size: 50),
                    Text('인사캠'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '대관 가능 시간',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.orange,
                      child: Center(child: Text('사용 중')),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.green,
                      child: Center(child: Text('예약 가능')),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('대관을 확정하시겠습니까?'),
                      content: Text('학생회관 1층 000$roomNumber\n15:00 ~ 16:00'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('아니오'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('예'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('대관 예약'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//검색하는 페이지
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: '동아리명, 친구 이름, 행사 이름 등',
            border: InputBorder.none,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('취소', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('최근 검색', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('제이다')),
                Chip(label: Text('헤게모니')),
                Chip(label: Text('킹고응원단')),
              ],
            ),
            SizedBox(height: 16),
            Text('모집중인 동아리', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                children: [
                  buildEventCard('C:/Users/tjxod/my_flutter_app/회의실1.png', '서클복! 서클복! 상시 모집'),
                  buildEventCard('C:/Users/tjxod/my_flutter_app/회의실1.png', '킹고스마트댄스 ~5월 15일'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('예정된 행사', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                children: [
                  buildEventCard('C:/Users/tjxod/my_flutter_app/회의실1.png', '2024 끈 여름 정기 공연'),
                  buildEventCard('C:/Users/tjxod/my_flutter_app/회의실1.png', '2024 헤게모니 5월 정기 공연'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      onTap: (index) {
          if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
      ),
    );
  }

  Widget buildEventCard(String imagePath, String title) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void _login() {
      final username = usernameController.text;
      final password = passwordController.text;

      if (username == 'skku' && password == 'love') {
        Navigator.of(context).pop();  // Navigate back to the previous page (MainPage)
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid credentials. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset('C:/Users/tjxod/my_flutter_app/Uniclub로고.png', height: 100), // Ensure you have a logo image
            SizedBox(height: 40),
            // Username field
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: '아이디',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Password field
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            // Login button
            ElevatedButton(
              onPressed: _login,
              child: Text('로그인'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            // Register link
            TextButton(
              onPressed: () {
                // Navigate to the registration page
              },
              child: Text('아직 회원이 아니신가요? 회원가입'),
            ),
            Spacer(),
            // Privacy policy and terms of service
            Text('개인정보처리방침 | 이용약관', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UniClub'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('총 동아리 수 48개  |  내 친구 수 8명'),
                Row(
                  children: [
                    Text('친구만'),
                    Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('제이다 | 어름 정기공연 | 19:00 | 소극장'),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text('파란 | OB 공연 | 19:00 | 홍대 버스킹'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CalendarPage()),
            );
          } else if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
      ),
    );
  }
}