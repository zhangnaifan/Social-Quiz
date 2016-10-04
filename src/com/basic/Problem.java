package com.basic;

import java.util.Vector;

import org.eclipse.jdt.internal.compiler.batch.Main;

public class Problem {

	private int problemID;
	private String problemTitle;

	// content = problem description and answer
	private String problemContent;

	// type 1 for single select
	// type 2 for multiple select
	// type 3 for open question
	private int type;
	private int ownerID;

	public int getProblemID() {
		return problemID;
	}

	public void setProblemID(int problemID) {
		this.problemID = problemID;
	}

	public String getProblemTitle() {
		return problemTitle;
	}

	public void setProblemTitle(String problemTitle) {
		this.problemTitle = problemTitle;
	}

	public String getProblemContent() {
		return problemContent;
	}

	public void setProblemContent(String problemContent) {
		this.problemContent = problemContent;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(int ownerID) {
		this.ownerID = ownerID;
	}

	public Problem(int problemID, String problemTitle, String problemContent,
			int type, int ownerID) {
		super();
		this.problemID = problemID;
		this.problemTitle = problemTitle;
		this.problemContent = problemContent;
		this.type = type;
		this.ownerID = ownerID;
	}
	
}
