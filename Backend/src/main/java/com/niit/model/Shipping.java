package com.niit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Shipping")
@Component
public class Shipping {
	@Id
	@GeneratedValue
	private String shippingid; 
	private String userid;
	private String name;
	
	
	private String mobileno;
	private String mailid;
	private String address;
	public String getMailid() {
		return mailid;
	}
	public void setMailid(String mailid) {
		this.mailid = mailid;
	}
	public void setShippingid(String shippingid) {
		this.shippingid = shippingid;
	}
	   
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShippingid() {
		return shippingid;
	}
	public void setShippingId(String shippingid) {
		this.shippingid = shippingid;
	}
	
	
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}