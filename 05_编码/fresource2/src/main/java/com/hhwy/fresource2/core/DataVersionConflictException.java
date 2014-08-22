package com.hhwy.fresource2.core;

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
