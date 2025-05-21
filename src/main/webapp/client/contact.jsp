<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Taste of Nepal</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fdf8f1;
            font-family: 'Segoe UI', Tahoma, sans-serif;
        }
        .contact-section {
            padding: 60px 20px;
        }
        .contact-card {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .form-control {
            margin-bottom: 20px;
        }
        iframe {
            width: 100%;
            height: 300px;
            border: none;
            border-radius: 10px;
        }
        .info-box {
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container contact-section">
    <div class="row">
        <!-- Contact Info -->
        <div class="col-md-6">
            <div class="info-box">
                <h3>Get in Touch</h3>
                <p><strong>Email:</strong> tasteofnepal@gmail.com</p>
                <p><strong>Phone:</strong> +977-61-123456</p>
                <p><strong>Address:</strong> Lakeside, Pokhara, Kaski, Nepal</p>
                <p><strong>Business Hours:</strong><br>Sun–Fri: 9am – 6pm<br>Saturday: Closed</p>
            </div>

<iframe src="https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d7031.523720043975!2d83.96520813023623!3d28.21454692832843!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2s!5e0!3m2!1sen!2snp!4v1747854617821!5m2!1sen!2snp" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>        </div>

        <!-- Contact Form -->
        <div class="col-md-6">
            <div class="contact-card">
                <h3>Send Us a Message</h3>
                <form onsubmit="showSuccess(event)">
                    <input type="text" class="form-control" placeholder="Your Name *" required>
                    <input type="email" class="form-control" placeholder="Your Email *" required>
                    <input type="text" class="form-control" placeholder="Subject" required>
                    <textarea class="form-control" rows="5" placeholder="Your Message *" required></textarea>
                    <button class="btn btn-primary" type="submit">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    function showSuccess(e) {
        alert("Submitted successfully!");
    }
</script>
</body>
</html>
