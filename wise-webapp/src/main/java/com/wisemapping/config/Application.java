package com.wisemapping.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@Configuration
@EnableTransactionManagement
@ComponentScan
@ImportResource("classpath:spring/wisemapping-common.xml")
public class Application {
    @Bean
    HandlerExceptionResolver errorHandler() {
        final SimpleMappingExceptionResolver result =  new SimpleMappingExceptionResolver();

        //mapping status code with view response.
        result.addStatusCode("reactInclude", 403);

        //setting default error view
        result.setDefaultErrorView("reactInclude");
        result.setDefaultStatusCode(500);
        return result;
    }

    @Bean
    public ViewResolver viewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);
        return resolver;
    }
}
