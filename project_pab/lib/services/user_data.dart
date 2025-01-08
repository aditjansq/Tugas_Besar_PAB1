// File: lib/services/user_data.dart

// Daftar untuk menyimpan data akun pengguna
List<Map<String, String>> accounts = [];

// Kelas untuk akun pengguna
class UserAccount {
  final String username;
  final String password;

  UserAccount({required this.username, required this.password});

  // Fungsi untuk mengonversi akun menjadi map
  Map<String, String> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  // Fungsi untuk membuat akun dari map
  static UserAccount fromMap(Map<String, String> map) {
    return UserAccount(
      username: map['username']!,
      password: map['password']!,
    );
  }
}

// Fungsi untuk menambahkan akun ke dalam daftar
void addAccount(UserAccount account) {
  accounts.add(account.toMap());
}

// Fungsi untuk mendapatkan daftar akun
List<Map<String, String>> getAccounts() {
  return accounts;
}
