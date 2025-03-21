*Say Goodbye to Grey Screen Errors in Your Flutter App!*

- Display a user-friendly error widget instead of a grey page when an error occurs.

- In debug mode or before pushing the application to production, a brief error detail will be displayed on a red screen, traditionally called the red screen of death, so the developer can trace what went wrong.

![Screenshot 2025-03-15 at 2 00 50 PM](https://github.com/user-attachments/assets/a67e34c5-efad-499f-a59f-8f31f36b7cfb)

- but in a production (released) app, this is not the case. Instead, a grey screen is displayed, which is scary for a user.

*Is there a fix?*

- Yes 😊 A friendly custom error widget could be created and displayed using Flutter’s ErrorWidget.builder method in the Material app builder method.

![Screenshot 2025-03-15 at 2 01 18 PM](https://github.com/user-attachments/assets/1b56770d-0942-46fe-9ada-44a60b8b300a)

Note: errorDetails is an object of FlutterErrorDetails, more error details could be accessed through this errorDetails object:

errorDetails.summary (Property)
errorDetails.exception (Property)
errorDetails.exceptionAsString() (Method)
The mentioned string properties above could be parsed to the CustomFlutterErrorWidget as preferred by the developer.

- For this application, when an error that could cause a grey page in production occurs, we would have this page below instead of a grey page:

- The custom error widget being displayed in case of error here is more better for a better user experience.

👊😊
