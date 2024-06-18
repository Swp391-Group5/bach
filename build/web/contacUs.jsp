<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/contact.css"/>
        <title>Contact</title>
    </head>
    <body>
        <section class="contact">
            <div class="contact">
                <h2>Contact Us</h2>
                <div class="contact-wrapper">
                    <div class="contact-form">
                        <h3> Send us a message </h3>
                        <form id="contact-form"> 
                            <div class="form-group">
                                <input type="text" id="name" name="name" placeholder="Your Name">
                            </div>
                            <div class="form-group">
                                <input type="email" id="email" name="email" placeholder="Your Email">
                            </div>
                            <div class="form-group">
                                <input type="text" id="phone" name="phone" placeholder="Phone no.">
                            </div>
                            <div class="form-group">
                                <input type="text" id="title" name="title" placeholder="Your title">
                            </div>
                            <div class="form-group">
                                <textarea id="message" name="message" placeholder="Your Message"></textarea>
                            </div>
                            <input type="hidden" name="_captcha" value="false">
                            <input type="hidden" name="_template" value="table">
                            <button id="sendButton" type="button" class="btn btn-light" onclick="SendEmail()">Send Message</button>
                        </form>
                        <noscript>
                        <style>
                            #sendButton {
                                display: none;
                            }</style>
                        </noscript>
                        <a href="home">Back</a>
                    </div>
                    <div class="contact-info">
                        <h3>Contact Information</h3>
                        <p><i class="fas fa-phone"></i> +1 23 456 789</p>
                        <p><i class="fas fa-envelope"></i> info@example.com</p>
                        <p><i class="fas fa-map-marker-alt"></i> 123 Street, City, Country</p>
                    </div>
                </div>
            </div>
            <noscript>
            <div style="padding: 10px; background-color: #f44336; color: white; text-align: center;">
                JavaScript is required to submit this form. Please enable JavaScript in your browser settings.
            </div>
            </noscript>

        </section>

        <script src="https://smtpjs.com/v3/smtp.js"></script>
        <script>
                                <script src="https://smtpjs.com/v3/smtp.js"></script>
        <script>
function SendEmail() {
                                        let name = document.getElementById("name").value;
                                let email = document.getElementById("email").value;
                                let phone = document.getElementById("phone").value;
                                let title = document.getElementById("title").value;
                                let message = document.getElementById("message").value;
                                // Tạo chuỗi định dạng ngày giờ
                                let formattedDate = new Date().toLocaleString();
                                // Tạo nội dung email với bảng CSS đẹp hơn sử dụng phép nối chuỗi
                                let body =
                                        '<div style="font-family: Arial, sans-serif; line-height: 1.5;">' +
                                        '<p>Someone just submitted your form:</p>' +
                                        '<table style="width: 100%; border-collapse: collapse; margin: 20px 0;">' +
                                        '<thead>' +
                                        '<tr>' +
                                        '<th style="background-color: #4CAF50; color: white; text-align: left; padding: 8px; border: 1px solid #ddd;">Name</th>' +
                                        '<th style="background-color: #4CAF50; color: white; text-align: left; padding: 8px; border: 1px solid #ddd;">Value</th>' +
                                        '</tr>' +
                                        '</thead>' +
                                        '<tbody>' +
                                        '<tr>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">name</td>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">' + name + '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">email</td>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">' + email + '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">phone</td>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">' + phone + '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">title</td>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">' + title + '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">message</td>' +
                                        '<td style="border: 1px solid #ddd; padding: 8px;">' + message + '</td>' +
                                        '</tr>' +
                                        '</tbody>' +
                                        '</table>' +
                                        '<p style="font-size: 0.9em; color: #555;">Submitted on ' + formattedDate + '</p>' +
                                        '</div>';
                                Email.send({
                                SecureToken: "326788e0-be47-4fdb-a163-d08a6483fb8d",
                                        Host: "smtp.elasticemail.com",
                                        Username: "bachdndhe176090@fpt.edu.vn",
                                        Password: "7081FBCDE2D263066C4BA30B3780182967E5",
                                        To: 'bachdndhe176090@fpt.edu.vn',
                                        From: "bachdndhe176090@fpt.edu.vn",
                                        Subject: "New Contact Us Message",
                                        Body: body,
                                }).then(
                                        message => alert(message)
                                        );
                                        };
                                        
                                        
                                        </script>


        </script>
    </body>
</html>
