package br.com.qintess;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Teste {

    public static void main(String[] args) {
        System.out.println(new BCryptPasswordEncoder().encode("123456"));
        System.out.println(new BCryptPasswordEncoder().encode("q1nt3ss"));
    }

}
