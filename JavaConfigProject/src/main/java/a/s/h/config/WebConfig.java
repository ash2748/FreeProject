package a.s.h.config;

import java.nio.charset.Charset;

import javax.servlet.Filter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

@Configuration
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootConfig.class};	//Root-Context.xml
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletConfig.class};	//Servlet-Context.xml
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	//response시 utf-8로 강제전환
	@Bean
	public HttpMessageConverter<String> responseBodyConverter() {
		return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	}
	
	@Bean
	public Filter characterEncodingFilter() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		return characterEncodingFilter;
	}
	
	
	 @Override
	 @Bean
	 protected Filter[] getServletFilters() {
	     CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
	     characterEncodingFilter.setEncoding("UTF-8");
	     characterEncodingFilter.setForceEncoding(true);
	     return new Filter[] {characterEncodingFilter};
	 }




}
