package com.hzm.config;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@Component
public class SwaggerConfig {
	@Bean
	public Docket api() {
		return new Docket(DocumentationType.SWAGGER_2).select().apis(RequestHandlerSelectors.basePackage("com.hzm.web")) // 显示所有类
				// .apis(RequestHandlerSelectors.withClassAnnotation(Api.class)) //只显示添加@Api注解的类
				.build().apiInfo(apiInfo());
	}

	private ApiInfo apiInfo() {
		return new ApiInfoBuilder().title("开放接口API") // 粗标题
				.description("HTTP对外开放接口") // 描述
				.version("1.0.0") // api version
				.termsOfServiceUrl("http://xxx.xxx.com").license("LICENSE") // 链接名称
				.licenseUrl("http://xxx.xxx.com") // 链接地址
				.build();
	}
}
