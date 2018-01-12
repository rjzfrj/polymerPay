package com.zyzf.polymer.pay.common.core.exception;
/**
 * 密码密钥处理异常
 * exception 
 * @author 颜铃璋
 * 创建时间：2017-6-21
 */
public class PinKeyException extends Exception{
	private static final long serialVersionUID = -6792009069635572497L;

	public PinKeyException(){
		super();
	}
	
	public PinKeyException(String msg){
		super(msg);
	}
	
	public PinKeyException(String msg,Throwable cause){
		super(msg,cause);
	}
	
	public PinKeyException(Throwable cause){
		super(cause);
	}
}
