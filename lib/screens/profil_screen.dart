import 'package:flutter/material.dart';
import 'package:wisata_candi/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO: 5. Implementasi fungsi signIn
  void signIn(){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }
  // TODO: 6. Implementasi fungsi SignOut
  void signOut(){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // TODO: 2. buat bagian profileheader yang berisi gambar profil
                Align(
                  alignment: AlignmentGeometry.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment:  Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple,width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("images/borobudur.jpeg"),
                          ),
                        ),
                        if(isSignedIn)
                          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt, color: Colors.deepPurple[50],))
                      ],
                    ),
                  ),
                ),
                
                // TODO: 3. buat bagian profileinfo yang berisi info profil
                SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                SizedBox(height: 4,),
                // Row(
                //   children: [
                //     SizedBox(width: MediaQuery.of(context).size.width / 3,
                //       child: Row(
                //         children: [
                //           Icon(Icons.lock, color: Colors.amber,),
                //           SizedBox(width: 8,),
                //           Text("Pengguna", style: TextStyle(
                //             fontSize: 18, fontWeight: FontWeight.bold
                //           ),)
                //         ],
                //       ),),
                //       Expanded(
                //         child: Text(': $userName', style: TextStyle(
                //           fontSize: 18
                //         ),),
                //       ),
                //       if(isSignedIn) Icon(Icons.edit)
                //   ],
                // ),
                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  iconColor: Colors.amber
                ),
                SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                SizedBox(height: 4,),
                // Row(
                //   children: [
                //     SizedBox(width: MediaQuery.of(context).size.width / 3,
                //       child: Row(
                //         children: [
                //           Icon(Icons.lock, color: Colors.amber,),
                //           SizedBox(width: 8,),
                //           Text("Nama", style: TextStyle(
                //             fontSize: 18, fontWeight: FontWeight.bold
                //           ),)
                //         ],
                //       ),),
                //       Expanded(
                //         child: Text(': $fullName', style: TextStyle(
                //           fontSize: 18
                //         ),),
                //       ),
                //       if(isSignedIn) Icon(Icons.edit)
                //   ],
                // ),
                ProfileInfoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: (){
                    // Tindakan saat ikon edit ditekan misalnya: pengeditannama
                    debugPrint('Icon edit ditekan ...');
                  },
                  iconColor: Colors.blue,
                ),
                SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                SizedBox(height: 4,),
                // Row(
                //   children: [
                //     SizedBox(width: MediaQuery.of(context).size.width / 3,
                //       child: Row(
                //         children: [
                //           Icon(Icons.lock, color: Colors.amber,),
                //           SizedBox(width: 8,),
                //           Text("Favorit", style: TextStyle(
                //             fontSize: 18, fontWeight: FontWeight.bold
                //           ),)
                //         ],
                //       ),),
                //       Expanded(
                //         child: Text(': $favoriteCandiCount', style: TextStyle(
                //           fontSize: 18
                //         ),),
                //       ),
                //       if(isSignedIn) Icon(Icons.edit)
                //   ],
                // ),
                ProfileInfoItem(
                  icon: Icons.favorite,
                  label: 'Favorit',
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount':'',
                  iconColor: Colors.red,
                ),
                //
                // TODO: 4. Buat profileactions yang berisi textbutton sign in/out
                SizedBox(height: 20,),
                Divider(color: Colors.deepPurple[100],),
                SizedBox(height: 4,),
                isSignedIn ? TextButton(
                  onPressed: signOut, 
                  child: Text("Sign Out")) 
                  : TextButton(
                    onPressed: signIn, 
                    child: Text('Sign In'))
              ],
            ),
          )
        ],
      )
    );
  }
}