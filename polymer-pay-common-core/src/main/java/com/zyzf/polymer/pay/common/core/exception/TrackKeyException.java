package com.zyzf.polymer.pay.common.core.exception;
/**
 * 二磁道密钥处理异常
 * exception 
 * @author 颜铃璋
 * 创建时间：2017-6-21
 */
public class TrackKeyException extends Exception{
	private static final long serialVersionUID = -6792009069635572497L;

	public TrackKeyException(){
		super();
	}
	
	public TrackKeyException(String msg){
		super(msg);
	}
	
	public TrackKeyException(String msg,Throwable cause){
		super(msg,cause);
	}
	
	public TrackKeyException(Throwable cause){
		super(cause);
	}
}
