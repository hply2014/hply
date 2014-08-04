package org.hhwy.fweb1.test;

import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

import org.hhwy.fweb1.controller.FieldTypesController;
import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

public class FieldTypesRestAPITest {
	private MockMvc mockMvc;

	@Before
	public void setup() throws Exception {

		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views");
		viewResolver.setSuffix(".jsp");

		this.mockMvc = standaloneSetup(new FieldTypesController())
				.setViewResolvers(viewResolver).build();
	}

	@Test
	public void submitSuccess() throws Exception {

//		this.mockMvc.perform(get("/api/fieldtypes").andExpect(content().string("Obtained 'foo' query parameter value 'bar'")));
		

	}
}
