package org.hhwy.rdc.fweb1;

public class DataVersionConflictException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DataVersionConflictException() {

	}

	public DataVersionConflictException(String message) {
		System.out.println(message);
	}

}
