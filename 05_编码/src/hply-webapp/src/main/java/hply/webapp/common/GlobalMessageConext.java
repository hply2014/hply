package hply.webapp.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;

public final class GlobalMessageConext {
	
	private static final String PROPERTY_FILE = "classpath:global.properties";

	private static GlobalMessageConext context = new GlobalMessageConext();

	public static GlobalMessageConext getInstance() {
		return context;
	}

	private Map<String, String> staticMessage = new HashMap<String, String>();
	private Map<String, String> dynamicMessage = new HashMap<String, String>();

	private GlobalMessageConext() {

	}

	public void setDynamicMessage(String key, String value) {
		this.dynamicMessage.put(key, value);
	}

	public String get(String key) {
		String value = null;
		if (this.staticMessage.containsKey(key)) {
			value = this.getStaticMessage(key);
		} else if (this.dynamicMessage.containsKey(key)) {
			value = this.getDynamicMessage(key);
		}
		return value;
	}

	public String get(String key, Object... args) {
		return MessageFormat.format(this.get(key), args);
	}

	public String getStaticMessage(String key) {
		return this.staticMessage.get(key).toString();
	}

	public String getStaticMessage(String key, Object... args) {
		return MessageFormat.format(this.getStaticMessage(key), args);
	}

	public String getDynamicMessage(String key) {
		return this.dynamicMessage.get(key).toString();
	}

	public String getDynamicMessage(String key, Object... args) {
		return MessageFormat.format(this.getDynamicMessage(key), args);
	}

	private boolean initialized = false;

	// 该方法在web应用启动后加载
	public void loadProperties(ServletContext context) {
		// 防止重复加载
		if (initialized)
			return;

		String path = context.getRealPath(PROPERTY_FILE);
		Properties prop = new Properties();
		try {
			InputStream is = new FileInputStream(path);
			prop.load(is);
			Utility.logger.info(path + " load successfull.");
		} catch (IOException e) {
			e.printStackTrace();
		}
		Utility.logger.info(PROPERTY_FILE + ":");
		Set<?> keyValue = prop.keySet();
		for (Iterator<?> it = keyValue.iterator(); it.hasNext();) {
			String key = (String) it.next();
			staticMessage.put(key, prop.getProperty(key));
			Utility.logger.info(key + "=" + prop.getProperty(key));
		}

		// 将当前应用的根路径存入动态变量
		this.setDynamicMessage("dynamic.realpath.webroot",
				context.getRealPath("/"));

		initialized = true;
	}
}
