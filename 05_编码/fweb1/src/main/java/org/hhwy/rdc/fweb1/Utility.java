package org.hhwy.rdc.fweb1;

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

	public static final String EMPTY = StringUtils.EMPTY;

	public static String getSmartTimeFormat(Date date) {
		Calendar calendar = Calendar.getInstance();
		int y0 = calendar.get(Calendar.YEAR);
		int m0 = calendar.get(Calendar.MONTH);
		int d0 = calendar.get(Calendar.DATE);

		calendar.setTime(date);

		int y1 = calendar.get(Calendar.YEAR);
		int m1 = calendar.get(Calendar.MONTH);
		int d1 = calendar.get(Calendar.DATE);

		// 默认为今年，但不是今
		String formatString = "MM/dd HH:mm";
		if (y0 != y1) {
			// 不是今年
			formatString = "yyyy-MM-dd";
		} else if (m0 == m1 && d0 == d1) {
			// 今天
			formatString = "今天 HH:mm";
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
			return Utility.EMPTY;
		}
		Date date = DateUtils.parseDate(str, new String[] {
				"yyyy-MM-dd HH:mm:ss.SSS", "yyyy-MM-dd HH:mm:ss" });

		return getSmartTimeFormat(date);
	}

	public static String getSmartSize(String size) {
		return StringUtils.isEmpty(size) ? EMPTY : getSmartSize(Double
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
	 * 以行为单位读取文件，常用于读面向行的格式化文
	 */
	public static String getFileContent(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			throw new IllegalArgumentException("企图读取不存在的文件内容，fileName="
					+ fileName);
		}
		BufferedReader reader = null;
		StringBuffer content = new StringBuffer();
		try {
			reader = new BufferedReader(new FileReader(file));

			String tempString = EMPTY;
			// 读入，直到读入null为文件结
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
	 * 根据分隔符获取最右边的部
	 */
	public static String getLastStage(String str, String delimiter) {
		int index = str.lastIndexOf(delimiter);
		return str.substring(index + 1);
	}

	public static String getApplicationURL(HttpServletRequest request) {
		String port = EMPTY;
		if (request.getServerPort() != 80) {
			port = ":" + request.getServerPort();
		}
		return request.getScheme() + "://" + request.getServerName() + port
				+ request.getContextPath() + "/";
	}

	/**
	 * 产生随机字符
	 * */
	public static Random randGen = new Random();
	private static char[] character = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
			.toCharArray();

	public static final String randomString(int length) {
		if (length < 1) {
			throw new IllegalArgumentException("企图生成长度小于1的随机字符串，length="
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
	 * 获取文件内容的MD5摘要信息
	 */
	public static String getFileMD5(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			throw new IllegalArgumentException("获取文件内容的MD5摘要信息，文件不存在，fileName="
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
			return EMPTY;
		}
		BigInteger bigInt = new BigInteger(1, digest.digest());
		return bigInt.toString(16);
	}

	/* 获取字符串的md5 */
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
	 * 字符串中是否包含非法字符
	 * 
	 * @return
	 */
	public static boolean hasIllegalCharacter(String str) {
		return StringUtils.containsAny(str, ILLEGAL_CHARACTER.toCharArray());
	}

	public static String dateFormat(Date date) {
		// 24小时
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
				// 根据网卡取本机配置的IP
				InetAddress inet = InetAddress.getLocalHost();
				ipAddress = inet.getHostAddress();
			} catch (UnknownHostException e) {
				e.printStackTrace();
				throw new RuntimeException("获取客户端地"
						+ getApplicationURL(request));
			}
		}
		return ipAddress;
	}

	public static void println(String str) {
		System.out.println(str);
	}

	public static void println(String pattern, Object... args) {
		System.out.println(MessageFormat.format(pattern, args));
	}

	public static String getRandomUUID() {
		String str = java.util.UUID.randomUUID().toString();
		return str.replaceAll("-", "").toLowerCase();

	}

}
