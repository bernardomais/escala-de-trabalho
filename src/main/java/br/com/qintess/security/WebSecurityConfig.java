package br.com.qintess.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.
                authorizeRequests()
                    .antMatchers("/webjars/**").permitAll()
                    .antMatchers("/css/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers("/assets/**").permitAll()
                    .antMatchers("/contato-suporte").permitAll()
                    .antMatchers("/dados-acesso").hasAnyRole("EDITOR")
                    .antMatchers("/lista-usuarios").hasAnyRole("ADMIN")
                    .anyRequest()
                    .authenticated()
                    .and()
                .formLogin()
                    .loginPage("/login").permitAll()
                    .and()
                .logout()
                    .permitAll()
                    .and()
                .rememberMe();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
        builder
                .inMemoryAuthentication()
                .withUser("admin").password("$2a$10$Z3ZMCO65/.b4p6yZA23eP.8Pt/5sz0IdoiqICYCbfw7V.FNzX554e").roles("USER", "EDITOR", "ADMIN")
                .and()
                .withUser("editor").password("$2a$10$Z3ZMCO65/.b4p6yZA23eP.8Pt/5sz0IdoiqICYCbfw7V.FNzX554e").roles("USER", "EDITOR")
                .and()
                .withUser("user").password("$2a$10$RkTVD0vVnTO9PcU2VbSOButxB3bavOmic/.cuhp4.0a9uml5Vg.bm").roles("USER");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
