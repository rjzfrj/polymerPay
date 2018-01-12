package com.zyzf.polymer.pay.accountcheck.app;

import java.io.FileNotFoundException;
import java.util.Date;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParameter;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.StopWatch;

import com.zyzf.polymer.pay.accountcheck.biz.CardAccountCheckBiz;
import com.zyzf.polymer.pay.common.core.utils.DateUtils;

public class App {
	public static void main(String[] args) throws FileNotFoundException, JobExecutionAlreadyRunningException, JobRestartException, JobInstanceAlreadyCompleteException, JobParametersInvalidException {

		ApplicationContext ac=new ClassPathXmlApplicationContext("classpath:spring/spring-context-service.xml");
//		PmsChannelDao pcdao=(PmsChannelDao) ac.getBean(PmsChannelDao.class);
	
//		CardAccountCheckMistakeDao cacMistakeDao=(CardAccountCheckMistakeDao)ac.getBean(CardAccountCheckMistakeDao.class);
//		JobParametersBuilder jobParameterBulider=(JobParametersBuilder) ac.getBean("jobParameterBulider");
	
//		PmsChannel ddd=pcdao.getById(8L);
//		AccCheckBill entity=new AccCheckBill();
//		entity.setBatchNo("123dfasd1111");
//		entity.setBillDate(new Date());
//		entity.setChannelId(1L);
//		entity.setBankOrderNum("6668881111S");
//		int ca=cacdao.insert(entity);
//		System.out.println(ca);
/*		CardAccountCheckBill entity1=new CardAccountCheckBill();
		entity1.setBatchNo("123666");
		entity1.setBillDate(new Date());
		entity1.setChannelId(1L);
		entity1.setBankOrderNum("666888");
		int aaaa=ccacdao.insert(entity1);
		System.out.println(ddd);
		System.out.println(aaaa);*/
	/*	
		AccountCheckBillDao ccacdao2=(AccountCheckBillDao) ac.getBean(AccountCheckBillDao.class);
		AccountCheckBill entity2=new AccountCheckBill();
		entity2.setBatchNo("1236665461");
		entity2.setBillDate(new Date());
		entity2.setChannelId(1L);
		entity2.setBankOrderNum("666888341");
		int a2=ccacdao2.insert(entity2);
		System.out.println(a2);*/
		
//		CardAccountCheckBillDao ccacdao3=(CardAccountCheckBillDao) ac.getBean(CardAccountCheckBillDao.class);
//		CardAccountCheckBill entity3=new CardAccountCheckBill();
//		entity3.setBatchNo("12366654611");
//		entity3.setBillDate(new Date());
//		entity3.setChannelId(1L);
//		entity3.setBankOrderNum("6668181834");
//		int a3=ccacdao3.insert(entity3);
//		System.out.println(a3);
//		
//		CardAccountCheckMistake ccm=new CardAccountCheckMistake();
//		ccm.setId(1L);
//		ccm.setAccountcheckbno("123");
//		ccm.setBillDate(new Date());
//		ccm.setTransNo("123456");
//		ccm.setChannelId(1234L);
//		int sss=cacMistakeDao.insert(ccm);
//		System.out.println(sss);
		
		
		//---------------------------解析入库-----------------------------------
/*		JobLauncher jobLauncher=(JobLauncher) ac.getBean("jobLauncher");
		Job reconciliationJob=(Job) ac.getBean("reconciliationJob");
		JobParametersBuilder jobParameterBulider=(JobParametersBuilder) ac.getBean("jobParameterBulider");
		StopWatch sw = new StopWatch();
		sw.start();
//		/ *
//		 * Spring Batch Job同一个job instance，成功执行后是不允许重新执行的【失败后是否允许重跑，
//		 * 可通过配置Job的restartable参数来控制，默认是true】，如果需要重新执行，可以变通处理，
//		 * 添加一个JobParameters构建类,以当前时间作为参数，保证其他参数相同的情况下却是不同的job instance
//		 * /
		jobParameterBulider.addDate("date", new Date());
		String fileName=DateUtils.formatDate(DateUtils.subDays(1),"yyyyMMdd");
		JobParameter jobPar=new JobParameter("file:D:/home/wft/"+fileName+".txt");
//		JobParameter jobPar=new JobParameter("file:D:/home/wft/20170730.txt");
		jobParameterBulider.addParameter("inputFile", jobPar);
		jobLauncher.run(reconciliationJob, jobParameterBulider.toJobParameters());
		sw.stop();*/
		
		//-----------------------------对账------------------------------------
		CardAccountCheckBiz accountCheckBiz=(CardAccountCheckBiz) ac.getBean("cardAccountCheckBiz");
		accountCheckBiz.check();
	}
}
