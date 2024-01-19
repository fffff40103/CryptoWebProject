import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class TestGmail {

    public static void main(String[] args) {
        // 你的 Gmail 地址和密码
        final String senderEmail = "testjava40103@gmail.com";
        final String senderPassword = "aqvv ppls ujjr vtvd";

        // 收件人地址
        final String recipientEmail = "fffff40103@gmail.com";

        // 设置邮件属性
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // 创建会话
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // 创建邮件对象
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject("Test Email from Java");
            message.setText("This is a test email sent from Java.");

            // 发送邮件
            Transport.send(message);

            System.out.println("邮件发送成功！");
        } catch (MessagingException e) {
            System.out.println("邮件发送失败：" + e.getMessage());
        }
    }
}
