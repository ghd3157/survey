package com.modu.service;

import com.modu.entity.SurveyInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

@Service
public class MailSendService {

    @Transactional
    public void sendMail(SurveyInfo surveyInfo) {
        // 메일 인코딩
        final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩

        String subject = "모두에듀 설문 [" + surveyInfo.getName() + "]";
        String fromEmail = "survey@modu.com";
        String fromUsername = "ModuEdu Admin";
        String toEmail = "cnddnr0208@naver.com, cnddnr0208@gmail.com, tjrgns2007@naver.com"; // 콤마(,)로 여러개 나열
//        String toEmail = "zzdlgksdjf00@naver.com";

        final String username = "cnddnr0208";
        final String password = "oxspsitfjlrfhytj";

        // 메일에 출력할 텍스트
        StringBuffer sb = new StringBuffer();
        sb.append("<h3>모두에듀 신규 접수를 알려드립니다.</h3>\n");
        sb.append("<h4>이름 : "+surveyInfo.getName()+"</h4>\n");
        sb.append("<h4>연락처 : "+surveyInfo.getPhone()+"</h4>\n");
        sb.append("<h4>목적 : "+surveyInfo.getObjective()+"</h4>\n");
        sb.append("<h4>최종학력 : "+surveyInfo.getEducation()+"</h4>\n");
//        sb.append("<h4>상담방식 : "+surveyInfo.getAdvice()+"</h4>\n");
//        sb.append("<h4>희망과정 : "+surveyInfo.get()+"</h4>\n");
        String html = sb.toString();

        // 메일 옵션 설정
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.quitwait", "false");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        try {
            // 메일 서버  인증 계정 설정
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            };

            // 메일 세션 생성
            Session session = Session.getInstance(props, auth);

            // 메일 송/수신 옵션 설정
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, fromUsername));
            message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
            message.setSubject(subject);
            message.setSentDate(new Date());

            // 메일 콘텐츠 설정
            Multipart mParts = new MimeMultipart();
            MimeBodyPart mTextPart = new MimeBodyPart();
            MimeBodyPart mFilePart = null;

            // 메일 콘텐츠 - 내용
            mTextPart.setText(html, bodyEncoding, "html");
            mParts.addBodyPart(mTextPart);

            // 메일 콘텐츠 설정
            message.setContent(mParts);

            // MIME 타입 설정
            MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
            MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
            MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
            MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
            MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
            MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
            CommandMap.setDefaultCommandMap(MailcapCmdMap);

            // 메일 발송
            Transport.send( message );

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
