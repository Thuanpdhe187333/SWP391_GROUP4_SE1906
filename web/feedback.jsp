<%@ page import="model.Feedback, java.util.List" %>
<html>
<head>
    <title>Feedback List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf7f9;
            margin: 50px;
        }
        h2 {
            color: #d81b60;
        }
        form {
            margin-bottom: 30px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        textarea {
            width: 100%;
            height: 100px;
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
        .feedback-box {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .not-found {
            color: #f44336;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Feedback for Product ID: ${productId}</h2>

<form action="feedback" method="post">
    <input type="hidden" name="action" value="create"/>
    <input type="hidden" name="productId" value="${productId}"/>
    <textarea name="content" placeholder="Write your feedback here..." required></textarea><br>
    <input type="submit" value="Submit Feedback"/>
</form>

<h3>All Feedback:</h3>
<%
    List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
    if (feedbacks != null && !feedbacks.isEmpty()) {
        for (Feedback fb : feedbacks) {
%>
    <div class="feedback-box">
        <b>Feedback ID:</b> <%= fb.getFeedbackId() %><br>
        <b>Content:</b> <%= fb.getContent() %><br>
        <b>Created At:</b> <%= fb.getCreatedAt() %><br>
        <a href="feedback?action=view&feedbackId=<%= fb.getFeedbackId() %>">View Detail</a>
    </div>
<%
        }
    } else {
%>
    <p class="not-found">No feedback found.</p>
<%
    }
%>

</body>
</html>
