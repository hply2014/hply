package org.hhwy.fweb1.exception;

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
