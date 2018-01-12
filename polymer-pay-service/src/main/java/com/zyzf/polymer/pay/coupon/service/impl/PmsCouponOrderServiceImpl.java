package com.zyzf.polymer.pay.coupon.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.aspectj.apache.bcel.classfile.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.dwz.MessageCode;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.DateConvertUtil;
import com.zyzf.polymer.pay.common.core.utils.NumberUtil;
import com.zyzf.polymer.pay.common.core.utils.ZipCompressorByAnt;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponOrder;
import com.zyzf.polymer.pay.coupon.service.PmsCouponOrderService;
import com.zyzf.polymer.pay.tran.dao.PmsTransInvestigDao;
import com.zyzf.polymer.pay.tran.entity.PmsTransInvestig;

@Service("pmsCouponOrderService")
public class PmsCouponOrderServiceImpl extends BaseServiceImpl<PmsCouponOrder> implements PmsCouponOrderService {
	@Autowired
	private PmsTransInvestigDao transInvestigDao;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Message investigScanOrder(Long orderId, Integer type, String createUser, String InvestigDesc) {
		int result = 0;

		Message msg = new Message();
		PmsCouponOrder entity = this.searchEntityById(orderId);
		if (entity != null) {
			if (entity.getIsInvestig() == 1) {
				msg.setStatusCode(MessageCode.ERROR);
				msg.setMessage("订单已经调单过不能再次调单");
				return msg;
			}

		}
		PmsCouponOrder entityst = new PmsCouponOrder();
		entityst.setOrderId(orderId);
		entityst.setIsInvestig(1);
		result = this.updateEntitySelective(entityst);
		PmsTransInvestig transInvestig = new PmsTransInvestig();
		transInvestig.setPayChannelType(entity.getPayChannelType());
		transInvestig.setTransId(entity.getOrderId() + "");
		transInvestig.setOrgId(entity.getOrgId());
		transInvestig.setOrgName(entity.getOrgName());
		transInvestig.setChannelId(000L);
		transInvestig.setChannelName("优惠券");
		transInvestig.setMcode(entity.getMcode());
		transInvestig.setTcode(entity.getTcode());
		transInvestig.setOrderTypeId(entity.getOrderTypeId());
		transInvestig.setTransMoney(entity.getPrice());
		transInvestig.setType(type);
		transInvestig.setStatus(2);
		transInvestig.setOrderDate(entity.getCreateTime());
		transInvestig.setCreateUser(createUser);
		transInvestig.setCreateTime(new Date());
		if (result > 0) {
			result = transInvestigDao.insert(transInvestig);
			if (result > 0) {
				msg.setStatusCode(MessageCode.SUCCESS);
				msg.setMessage("订单成功调单");
				return msg;
			} else {
				throw new RuntimeException("回滚数据插入失败");
			}
		} else {
			msg.setStatusCode(MessageCode.ERROR);
			msg.setMessage("订单调单失败");
			return msg;
		}
	}

	// 导出
	public String exportOrder(List<PmsCouponOrder> scanOrderList, Integer isAdmin) throws Exception {
		if (null == scanOrderList || scanOrderList.size() == 0) {
			return null;
		}
		Date date = new Date();
		String rootPath = this.getClass().getClassLoader().getResource("/").getPath();
		String dPIUrl = rootPath + "/document/temp/scanOrder/";
		File dirFile = new File(dPIUrl);
		String dir = dirFile.getAbsolutePath();
		System.out.println("absolute path：" + dir);
		StringBuilder sb = new StringBuilder();
		String dirDateStr = DateConvertUtil.dateString(date);
		// 拼接文件路径
		String path = sb.append(dir).append(File.separator).append(dirDateStr).append(File.separator).append(scanOrderList.get(0).getMcode()).append(File.separator)
				.append(new SimpleDateFormat("yyyyMMddHHmmss").format(date)).toString();
		File file = new File(path);
		if (file.exists()) {// 文件已经存在
			return file.getPath() + ".zip";
		} else {
			file.mkdirs();
		}
		String baseRPath = file.getPath();

		Double maxSize = 20000.0;// 设置每个excel最多几行数据
		int num = (int) Math.ceil(scanOrderList.size() / maxSize);// 计算需要生成几个excel
		for (int j = 0; j < num; j++) {

			if (0 == isAdmin) {
				// 开始创建Excel
				// 创建新的Excel 工作簿
				String[] tableHeader = { "交易流水", "终端号", "所属机构", "优惠券代码", "现价", "优惠价", "种类", "状态", "订单类型", "更新时间"};
				HSSFWorkbook workbook = new HSSFWorkbook();
				HSSFSheet sheet = workbook.createSheet("优惠券订单表");
				sheet.setDefaultColumnWidth(20); // 设置列宽

				// 标题
				HSSFFont titleFont = workbook.createFont();
				titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
				titleFont.setFontHeightInPoints((short) 12);
				// 生成style样式类
				HSSFCellStyle titleStyle = workbook.createCellStyle();
				// 设置文字位置
				titleStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 居中
				titleStyle.setFont(titleFont);
				HSSFRow titleRow = sheet.createRow(0);
				for (int i = 0; i < tableHeader.length; i++) {
					HSSFCell titleCell = titleRow.createCell(i);
					titleCell.setCellStyle(titleStyle);
					// titleCell.setEncoding(HSSFCell.ENCODING_UTF_16);
					titleCell.setCellValue(tableHeader[i]);
				}

				// 2*****************遍历数据******************
				int start = maxSize.intValue() * j;
				int end = scanOrderList.size() < maxSize.intValue() * (j + 1) ? scanOrderList.size() : maxSize.intValue() * (j + 1);
				String orderTypeName = null;
				String statusDesc = null;
				for (int i = start; i < end; i++) {
					// 逐行写入数据
					HSSFRow row = sheet.createRow(i % maxSize.intValue() + 1);
					PmsCouponOrder d = scanOrderList.get(i);
					row.createCell(0).setCellValue(d.getOrderId());// 交易流水
					row.createCell(1).setCellValue(d.getTcode());// 终端号
					row.createCell(2).setCellValue( d.getOrgName());// 所属机构
					row.createCell(3).setCellValue(d.getCouponCode() );// 商户号
					row.createCell(4).setCellValue( d.getOrgName());// 商户号
					row.createCell(5).setCellValue( d.getCouponCode());// 终端号
					row.createCell(6).setCellValue(null == d.getCurrentPrice()?0: NumberUtil.roundF2(d.getCurrentPrice() / 100.0));//现价
					row.createCell(7).setCellValue(null == d.getPrice()?0: NumberUtil.roundF2(d.getPrice() / 100.0));// 优惠价
					row.createCell(8).setCellValue(null == d.getPrice()?0: NumberUtil.roundF2(d.getPrice() / 100.0));
					 switch (d.getStatus()) {// 客户端类型
			            case 0:
			              row.createCell(9).setCellValue("兑换失败");
			              break;
			            case 1:
			              row.createCell(9).setCellValue("完成兑换");
			              break;
			            case 2:
			              row.createCell(9).setCellValue("处理中");
			              break;
			            case 3:
			            	row.createCell(9).setCellValue("等待兑换");
			            	break;
			            case 4:
			            	row.createCell(9).setCellValue("兑换时锁");
			            	break;
			            case 5:
			            	row.createCell(9).setCellValue("交易关闭");
			            	break;
			            default:
			              row.createCell(9).setCellValue("-");
			              break;
			          }
					row.createCell(13).setCellValue(DateConvertUtil.dateTimeString(d.getCreateTime()));// 创建日期
				}
				sheet.setGridsPrinted(true);

				String xlsFileName = baseRPath + "/" + new SimpleDateFormat("yyyyMMdd").format(date) + (j + 1) + ".xls";
				OutputStream out = new FileOutputStream(new File(xlsFileName));

				workbook.write(out);
				out.flush();
				out.close();
			} else {
				// 开始创建Excel
				// 创建新的Excel 工作簿
				String[] tableHeader = { "交易流水", "终端号", "所属机构", "优惠券代码", "现价", "优惠价", "种类", "状态", "订单类型", "更新时间"};
				HSSFWorkbook workbook = new HSSFWorkbook();
				HSSFSheet sheet = workbook.createSheet("优惠券订单表");
				sheet.setDefaultColumnWidth(20); // 设置列宽

				// 标题
				HSSFFont titleFont = workbook.createFont();
				titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
				titleFont.setFontHeightInPoints((short) 12);
				// 生成style样式类
				HSSFCellStyle titleStyle = workbook.createCellStyle();
				// 设置文字位置
				titleStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 居中
				titleStyle.setFont(titleFont);
				HSSFRow titleRow = sheet.createRow(0);
				for (int i = 0; i < tableHeader.length; i++) {
					HSSFCell titleCell = titleRow.createCell(i);
					titleCell.setCellStyle(titleStyle);
					// titleCell.setEncoding(HSSFCell.ENCODING_UTF_16);
					titleCell.setCellValue(tableHeader[i]);
				}

				// 2*****************遍历数据******************
				int start = maxSize.intValue() * j;
				int end = scanOrderList.size() < maxSize.intValue() * (j + 1) ? scanOrderList.size() : maxSize.intValue() * (j + 1);
				String orderTypeName = null;
				String statusDesc = null;
				for (int i = start; i < end; i++) {
					// 逐行写入数据
					HSSFRow row = sheet.createRow(i % maxSize.intValue() + 1);
					PmsCouponOrder d = scanOrderList.get(i);
					row.createCell(0).setCellValue(d.getOrderId());// 交易流水
					row.createCell(1).setCellValue(d.getTcode());// 终端号
					row.createCell(2).setCellValue( d.getOrgName());// 所属机构
					row.createCell(3).setCellValue(d.getCouponCode() );// 商户号
					row.createCell(4).setCellValue( d.getOrgName());// 商户号
					row.createCell(5).setCellValue( d.getCouponCode());// 终端号
					row.createCell(6).setCellValue(null == d.getCurrentPrice()?0: NumberUtil.roundF2(d.getCurrentPrice() / 100.0));//现价
					row.createCell(7).setCellValue(null == d.getPrice()?0: NumberUtil.roundF2(d.getPrice() / 100.0));// 优惠价
					row.createCell(8).setCellValue(null == d.getPrice()?0: NumberUtil.roundF2(d.getPrice() / 100.0));
					 switch (d.getStatus()) {// 客户端类型
			            case 0:
			              row.createCell(9).setCellValue("兑换失败");
			              break;
			            case 1:
			              row.createCell(9).setCellValue("完成兑换");
			              break;
			            case 2:
			              row.createCell(9).setCellValue("处理中");
			              break;
			            case 3:
			            	row.createCell(9).setCellValue("等待兑换");
			            	break;
			            case 4:
			            	row.createCell(9).setCellValue("兑换时锁");
			            	break;
			            case 5:
			            	row.createCell(9).setCellValue("交易关闭");
			            	break;
			            default:
			              row.createCell(9).setCellValue("-");
			              break;
			          }
					row.createCell(13).setCellValue(DateConvertUtil.dateTimeString(d.getCreateTime()));// 创建日期
				}
				sheet.setGridsPrinted(true);

				String xlsFileName = baseRPath + "/" + new SimpleDateFormat("yyyyMMdd").format(date) + (j + 1) + ".xls";
				OutputStream out = new FileOutputStream(new File(xlsFileName));

				workbook.write(out);
				out.flush();
				out.close();
			}
		}
		ZipCompressorByAnt zca = new ZipCompressorByAnt(baseRPath + ".zip");
		zca.compress(baseRPath);
		return baseRPath + ".zip";
	}

}