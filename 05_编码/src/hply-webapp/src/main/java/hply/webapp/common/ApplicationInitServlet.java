package hply.webapp.common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ApplicationInitServlet extends HttpServlet {
	private static final long serialVersionUID = 5587127744062936379L;

	public void init() throws ServletException {
		/*
		 * ��ʼ��ϵͳȫ�ֲ���
		 */
		GlobalMessageConext.getInstance().loadProperties(
				this.getServletContext());
		/*
		 * ��ʼ�����ݿ�����
		 */
		// JdbcTemplateContext.get();
//		Utility.println(Utility.EMPTY_STRING);

		Utility.println("------------------------------------------------------------------------\n");
		Utility.println(GlobalMessageConext.getInstance().get(
				"static.application.name")
				+ " HAS BEEN SUCCESSFULLY STARTED.");
		Utility.println("\n------------------------------------------------------------------------");
	}
}
