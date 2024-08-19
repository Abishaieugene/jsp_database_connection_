<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
          background-image: url("${pageContext.request.contextPath}/images/motherteresanew.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9); /* Light transparent background for the form */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 35%; /* Reduced width */
            max-width: 350px; /* Adjusted max-width */
            margin: auto;
            position: absolute;
            top: 50%;
            left: 10%; /* Left placement with some gap */
            transform: translateY(-50%);
        }

        .form-container h2, .form-container h3, .form-container p {
            text-align: center;
            margin: 10px 0;
        }

        .form-container h2 {
            color: red; /* Make sure the text is visible */
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="tel"],
        .form-container input[type="password"],
        .form-container input[type="date"],
        .form-container textarea,
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid gold;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-container .gender-options {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .form-container .gender-options label {
            display: flex;
            align-items: center;
        }

        .form-container input[type="submit"] {
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: chartreuse;
        }

        @media (max-width: 768px) {
            .form-container {
                width: 60%; /* Adjusted width for tablets */
                padding: 20px;
                left: 5%; /* Adjust left positioning */
            }
        }

        @media (max-width: 480px) {
            .form-container {
                width: 80%; /* Adjusted width for small screens */
                padding: 15px;
                left: 5%; /* Further adjust left positioning */
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Mother Mary School</h2>
        <h3>Registration Form</h3>
        <form action="register" method="post">
            <label for="firstname">First Name</label>
            <input type="text" id="firstname" name="firstname" required />

            <label for="lastname">Last Name</label>
            <input type="text" id="lastname" name="lastname" required />

            <label for="birthday">Birthday</label>
            <input type="date" id="birthday" name="birthday" required />

            <label>Gender</label>
            <div class="gender-options">
                <label><input type="radio" name="gender" value="male" required> Male</label>
                <label><input type="radio" name="gender" value="female" required> Female</label>
            </div>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required />

            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone" required />

            <label for="address">Address</label>
            <textarea id="address" name="address" rows="4"></textarea>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />

            <input type="submit" value="Register" />
        </form>
    </div>
</body>
</html>
