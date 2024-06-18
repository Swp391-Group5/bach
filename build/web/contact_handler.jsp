<%-- 
    Document   : contact_handler
    Created on : Jun 13, 2024, 11:32:05 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%
    // Đặt kiểu nội dung trả về là HTML
    response.setContentType("text/html;charset=UTF-8");

    // Lấy dữ liệu từ form
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String title = request.getParameter("title");
    String message = request.getParameter("message");

    // Kiểm tra xem có dữ liệu nào bị bỏ trống hay không
    if (name != null && email != null && phone != null && title != null && message != null) {
        // Thông tin SMTP của máy chủ email
        String host = "smtp.elasticemail.com";
        String username = "bachdndhe176090@fpt.edu.vn";
        String password = "7081FBCDE2D263066C4BA30B3780182967E5";
        String from = "bachdndhe176090@fpt.edu.vn";
        String to = "bachdndhe176090@fpt.edu.vn";

        // Tạo Properties cho phiên gửi email
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "2525");

        // Tạo phiên gửi email
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo message mới
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            msg.setSubject("New Contact Us Message");

            // Tạo nội dung email
            String emailContent = "<div style='font-family: Arial, sans-serif; line-height: 1.5;'>" +
                    "<p>Someone just submitted your form:</p>" +
                    "<table style='width: 100%; border-collapse: collapse; margin: 20px 0;'>" +
                    "<thead>" +
                    "<tr>" +
                    "<th style='background-color: #4CAF50; color: white; text-align: left; padding: 8px; border: 1px solid #ddd;'>Name</th>" +
                    "<th style='background-color: #4CAF50; color: white; text-align: left; padding: 8px; border: 1px solid #ddd;'>Value</th>" +
                    "</tr>" +
                    "</thead>" +
                    "<tbody>" +
                    "<tr>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>name</td>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>" + name + "</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>email</td>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>" + email + "</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>phone</td>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>" + phone + "</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>title</td>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>" + title + "</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>message</td>" +
                    "<td style='border: 1px solid #ddd; padding: 8px;'>" + message + "</td>" +
                    "</tr>" +
                    "</tbody>" +
                    "</table>" +
                    "</div>";

            msg.setContent(emailContent, "text/html");

            // Gửi email
            Transport.send(msg);

            // In ra thông báo thành công
            out.println("<p>Message sent successfully!</p>");
        } catch (MessagingException e) {
            e.printStackTrace();
            out.println("<p>Failed to send message. Please try again later.</p>");
        }
    } else {
        out.println("<p>All fields are required. Please go back and fill in all fields.</p>");
    }
%>

