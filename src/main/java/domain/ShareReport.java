package domain;

import java.util.Date;

public class ShareReport {
	private String fullname;
	private String fromEmail;
	private String toEmail;
	private Date sendDate;

	public ShareReport() {
	}

	public ShareReport(String fullname, String fromEmail, String toEmail, Date sendDate) {
		this.fullname = fullname;
		this.fromEmail = fromEmail;
		this.toEmail = toEmail;
		this.sendDate = sendDate;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

}
