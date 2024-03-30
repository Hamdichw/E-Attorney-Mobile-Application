import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  // Implement the keys with proper translations
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "العربية",
          "2": "الإنجليزية",
          "3": "الفرنسية",
          "4": "لغة",
          "5": "إدارة المستخدمين",
          "6": "المعلومات",
          "7": "تسجيل الخروج",
          "8": "تحرير الملف الشخصي",
          "9": "الاسم الكامل",
          "10": "البريد الإلكتروني",
          "11": "الهاتف",
          "12": "كلمة المرور",
          "13": "حفظ"
        },
        "en": {
          "1": "Arabic",
          "2": "English",
          "3": "French",
          "4": "Language",
          "5": "User Management",
          "6": "Information",
          "7": "Logout",
          "8": "Edit Profile",
          "9": "Full Name",
          "10": "Email",
          "11": "Phone",
          "12": "Password",
          "13": "Save"
        },
        "fr": {
          "1": "Arabe",
          "2": "Anglais",
          "3": "Français",
          "4": "Langue",
          "5": "Gestion des Utilisateurs",
          "6": "Informations",
          "7": "Déconnexion",
          "8": "Éditer le Profil",
          "9": "Nom et Prénom",
          "10": "E-mail",
          "11": "Téléphone",
          "12": "Mot de passe",
          "13": "Enregistrer"
        }
      };
}
