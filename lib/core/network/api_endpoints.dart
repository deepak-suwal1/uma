//auth
const String registerPath = 'api/Auth/registercustomer';
const String loginPath = 'api/Auth/logincustomer';
const String googleLoginPath = 'api/Auth/googlesignon';
const String refreshTokenPath = 'api/Auth/refresh';
const String checkInPath = 'api/Customer/checkin';
const String checkOutPath = 'api/Customer/checkout';

//menu
const String getAllMenuPath = 'api/Menu/getmenuitems';
const String addMenuPath = 'api/Menu/addmenuitem';
const String updateMenuPath = 'api/Menu/updatemenuitem';
const String deleteMenuPath = 'api/Menu/deletemenuitems';

//table
const String getAllTablePath = 'api/Table/getall';
const String addTablePath = 'api/Table/create';
const String deleteTablePath = 'api/Table/remove';

//order
const String getAllOrdersPath = 'api/Order/getmyorders';
const String placeOrderPath = 'api/Order/placeorder';

const String sendOtpPath = 'api/v1/otp/sent';
const String resendOtpPath = 'api/v1/system-otp';
const String verifyOtpPath = 'api/v1/system-otp/verification';
const String forgotPasswordVerifyOtpPath =
    'api/v1/forgot-password/verify-token';
const String forgotPasswordPath = 'api/v1/forgot-password';
const String resetPasswordPath = 'api/v1/forgot-password/reset';
const String resendEmailVerificationPath = 'api/v1/email/resend-verification';
const String userPath = 'api/v1/email/resend-verification';
