package hply.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author cqiyi
 * 
 */
public class Utility {
	
	public static Log logger = LogFactory.getLog(Utility.class);

	public static final String EMPTY_STRING = "";
	public static final String NOTHING_STRING = "NOTHING";

	public static String getSmartTimeFormat(Date date) {
		Calendar calendar = Calendar.getInstance();
		int y0 = calendar.get(Calendar.YEAR);
		int m0 = calendar.get(Calendar.MONTH);
		int d0 = calendar.get(Calendar.DATE);

		calendar.setTime(date);

		int y1 = calendar.get(Calendar.YEAR);
		int m1 = calendar.get(Calendar.MONTH);
		int d1 = calendar.get(Calendar.DATE);

		// Ĭ��Ϊ���꣬�����ǽ�??
		String formatString = "MM/dd HH:mm";
		if (y0 != y1) {
			// ���ǽ���
			formatString = "yyyy-MM-dd";
		} else if (m0 == m1 && d0 == d1) {
			// ����
			formatString = "���� HH:mm";
		}

		return DateFormatUtils.format(date, formatString);
	}

	/**
	 * @param str
	 * @return
	 * @throws ParseException
	 */
	public static String getSmartTimeFormat(String str) throws ParseException {
		// 1964-04-20 20:46:24.000
		if (StringUtils.isEmpty(str)) {
			return Utility.EMPTY_STRING;
		}
		Date date = DateUtils.parseDate(str, new String[] {
				"yyyy-MM-dd HH:mm:ss.SSS", "yyyy-MM-dd HH:mm:ss" });

		return getSmartTimeFormat(date);
	}

	public static String getSmartSize(String size) {
		return StringUtils.isEmpty(size) ? EMPTY_STRING : getSmartSize(Double
				.parseDouble(size));
	}

	public static String getSmartSize(double size) {
		String[] units = { "B", "KB", "MB", "GB", "TB", "PB" };
		DecimalFormat df = new DecimalFormat("#.00");
		for (int i = 0; i < units.length; i++) {
			if (size < 1024) {
				return df.format(size) + units[i];
			}
			size = size / 1024;
		}
		return String.format("%1$d", size, units[units.length - 1]);
	}

	/**
	 * @param str
	 * @return
	 */
	public static boolean convertBoolean(String str) {
		return "true".equals(str);
		// return Integer.parseInt(str) == 1;
	}

	/**
	 * ����Ϊ��λ��ȡ�ļ��������ڶ������еĸ�ʽ����??
	 */
	public static String getFileContent(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			throw new IllegalArgumentException("��ͼ��ȡ�����ڵ��ļ����ݣ�fileName="
					+ fileName);
		}
		BufferedReader reader = null;
		StringBuffer content = new StringBuffer();
		try {
			reader = new BufferedReader(new FileReader(file));

			String tempString = EMPTY_STRING;
			// ????����????��ֱ������nullΪ�ļ���??
			while ((tempString = reader.readLine()) != null) {
				content.append(tempString + "\n");
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}

		return content.toString();
	}

	/**
	 * ���ݷָ�����ȡ���ұߵĲ�??
	 */
	public static String getLastStage(String str, String delimiter) {
		int index = str.lastIndexOf(delimiter);
		return str.substring(index + 1);
	}

	public static String getApplicationURL(HttpServletRequest request) {
		String port = Utility.EMPTY_STRING;
		if (request.getServerPort() != 80) {
			port = ":" + request.getServerPort();
		}
		return request.getScheme() + "://" + request.getServerName() + port
				+ request.getContextPath() + "/";
	}

	/**
	 * ��������ַ�??
	 * */
	public static Random randGen = new Random();
	private static char[] character = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
			.toCharArray();

	public static final String randomString(int length) {
		if (length < 1) {
			throw new IllegalArgumentException("��ͼ���ɳ���С��1������ַ�����length="
					+ length);
		}
		char[] randBuffer = new char[length];
		for (int i = 0; i < randBuffer.length; i++) {
			randBuffer[i] = character[randGen.nextInt(character.length - 1)];
		}
		return new String(randBuffer);
	}

	/**
	 * 
	 * ��ȡ�ļ����ݵ�MD5ժҪ��Ϣ
	 */
	public static String getFileMD5(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			throw new IllegalArgumentException("��ȡ�ļ����ݵ�MD5ժҪ��Ϣ���ļ������ڣ�fileName="
					+ fileName);
		}
		MessageDigest digest = null;
		int len;
		try {
			byte buffer[] = new byte[1024];
			digest = MessageDigest.getInstance("MD5");
			FileInputStream in = new FileInputStream(file);
			while ((len = in.read(buffer, 0, 1024)) != -1) {
				digest.update(buffer, 0, len);
			}
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			return Utility.EMPTY_STRING;
		}
		BigInteger bigInt = new BigInteger(1, digest.digest());
		return bigInt.toString(16);
	}

	/* ��ȡ????�ַ�����md5??*/
	public static String getStringMD5(String str) {
		BigInteger bigInt = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.update(str.getBytes());
			bigInt = new BigInteger(1, digest.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return bigInt.toString(16);
	}

	public static final String ILLEGAL_CHARACTER = " ,;-%&?.|`";

	/**
	 * �ַ������Ƿ�����Ƿ��ַ�
	 * 
	 * @return
	 */
	public static boolean hasIllegalCharacter(String str) {
		return StringUtils.containsAny(str, ILLEGAL_CHARACTER.toCharArray());
	}

	public static String dateFormat(Date date) {
		// 24Сʱ??
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(date);
	}

	public static String getClientIpAddress(HttpServletRequest request) {
		String ipAddress = request.getHeader("x-forwarded-for");

		if (StringUtils.isEmpty(ipAddress)
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (StringUtils.isEmpty(ipAddress)
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (StringUtils.isEmpty(ipAddress)
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
		}
		if (ipAddress.equals("127.0.0.1")
				|| ipAddress.equals("0:0:0:0:0:0:0:1")) {
			try {
				// ��������ȡ�������õ�IP
				InetAddress inet = InetAddress.getLocalHost();
				ipAddress = inet.getHostAddress();
			} catch (UnknownHostException e) {
				e.printStackTrace();
				throw new RuntimeException("��ȡ�ͻ��˵�??????"
						+ getApplicationURL(request));
			}
		}
		return ipAddress;
	}

	/*
	 * �ڽű�ִ�в��ϴ���ɺ����з������ϵĵ������ݿ�ű�
	 */
	public static void executeImportMlgFiles() {
		try {
			String cmd = "echo executeImportMlgFiles>>mlg.implog";
			Runtime.getRuntime().exec(cmd);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void println(String str) {
		System.out.println(str);
	}

	public static void println(String pattern, Object... args) {
		System.out.println(MessageFormat.format(pattern, args));
	}
	public static String nothing(String str) {
		return StringUtils.isEmpty(str) ? NOTHING_STRING : str;
	}

}
