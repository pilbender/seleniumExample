package net.raescott.seleniumexample;

/**
 * Simple Data Transfer Object.
 *
 * @author Richard Scott Smith <scott.smith@isostech.com>
 */
public class StateDto {
	private String name;
	private String state;

	public StateDto(String name, String state) {
		this.name = name;
		this.state = state;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
