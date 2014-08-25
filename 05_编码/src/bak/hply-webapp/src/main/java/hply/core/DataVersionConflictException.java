package hply.core;

/**
 * 数据版本冲突异常
 */
public class DataVersionConflictException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 235116794309156883L;

	public DataVersionConflictException() {

	}

	public DataVersionConflictException(String message) {
		System.out.println(message);
	}

}