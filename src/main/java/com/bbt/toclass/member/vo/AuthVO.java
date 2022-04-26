package com.bbt.toclass.member.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class AuthVO extends Authenticator{

    PasswordAuthentication pa;

    public AuthVO() {
        String mail_id = "toclass.authentication";
        String mail_pw = "1qaz2wsx##";
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return this.pa;
    }

}



