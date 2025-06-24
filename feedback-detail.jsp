<%@ page import="model.Feedback" %>
<html>
<head>
    <title>Feedback Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf7f9;
            margin: 50px;
        }
        h2 {
            color: #d81b60;
        }
        textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            border: 1px solid #f8bbd0;
            border-radius: 5px;
            resize: none;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #f48fb1;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #ec407a;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .not-found {
            color: #f44336;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
<%
    Feedback feedback = (Feedback) request.getAttribute("feedback");
    if (feedback != null) {
%>
    <h2>Feedback Detail (ID: <%= feedback.getFeedbackId() %>)</h2>
    <form action="feedback" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="feedbackId" value="<%= feedback.getFeedbackId() %>"/>
        <textarea name="content"><%= feedback.getContent() %></textarea><br>
        <input type="submit" value="Update Feedback"/>
    </form>
<%
    } else {
%>
    <p class="not-found">Feedback not found!</p>
<%
    }
%>
</div>
</body>
</html>
