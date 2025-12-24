package io.github.wizwix.letsfutsal.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.context.annotation.Bean;

@Configuration
@EnableWebMvc
@ComponentScan("io.github.wizwix")
@MapperScan("io.github.wizwix.FreeBoard")
public class WebConfig {

	@Bean
	public InternalResourceViewResolver viewResolver() {
	    InternalResourceViewResolver vr = new InternalResourceViewResolver();
	    vr.setPrefix("/WEB-INF/views/");  
	    vr.setSuffix(".jsp");
	    
	    vr.setViewClass(org.springframework.web.servlet.view.JstlView.class);
	    return vr;
	}
}