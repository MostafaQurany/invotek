import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';

class UserDeletionHelper {
  /// التحقق من إمكانية حذف المستخدم
  /// 
  /// يُرجع true إذا كان يمكن حذف المستخدم
  /// يُرجع false إذا كان المستخدم admin أو المستخدم الحالي نفسه
  static bool canDeleteUser(User userToDelete) {
    final currentUserData = StorageService.getUserData();
    if (currentUserData?.user == null) return false;
    
    final currentUser = currentUserData!.user!;
    
    // منع حذف المستخدم الحالي نفسه
    if (currentUser.id == userToDelete.id) {
      return false;
    }
    
    // منع حذف المستخدمين من نوع admin
    final role = userToDelete.role?.toLowerCase() ?? '';
    if (role == 'admin' || role == 'مدير') {
      return false;
    }
    
    return true;
  }
  
  /// الحصول على رسالة الخطأ المناسبة
  static String? getDeletionErrorMessage(User userToDelete) {
    final currentUserData = StorageService.getUserData();
    if (currentUserData?.user == null) return null;
    
    final currentUser = currentUserData!.user!;
    
    // التحقق من المستخدم الحالي نفسه
    if (currentUser.id == userToDelete.id) {
      return 'usersCannotDeleteYourselfMessage';
    }
    
    // التحقق من admin
    final role = userToDelete.role?.toLowerCase() ?? '';
    if (role == 'admin' || role == 'مدير') {
      return 'usersCannotDeleteAdminMessage';
    }
    
    return null;
  }
}

