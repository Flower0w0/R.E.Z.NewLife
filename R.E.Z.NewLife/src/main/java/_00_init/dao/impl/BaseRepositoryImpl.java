package _00_init.dao.impl;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _00_init.dao.BaseRepository;
import _00_init.util.DBService;
import _00_init.util.GlobalService;
import _01_register.model.MemberBean;
import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;

@Repository
public class BaseRepositoryImpl implements BaseRepository {
	public static final String UTF8_BOM = "\uFEFF"; // 定義BOM字元

	private static Logger log = LoggerFactory.getLogger(BaseRepositoryImpl.class);

	SessionFactory factory;

	ServletContext servletContext;

	@Autowired
	public BaseRepositoryImpl(SessionFactory factory, ServletContext servletContext) {
		this.factory = factory;
		this.servletContext = servletContext;
	}

	@Override
	public void loadInitData() {

		String line = "";
		int count = 0;

		
		try {
			Session session = factory.getCurrentSession();
			String realPath = servletContext.getRealPath("/WEB-INF/");
			log.info("realPath=" + realPath);
			// 1. newProduct表格
			// 1-1 由"/WEB-INF/rez_data/newProduct.txt"逐筆讀入newProduct表格內的初始資料，
			// 然後依序新增到newProduct表格中
			try (
				InputStream is = servletContext.getResourceAsStream("/WEB-INF/rez_data/newProduct.txt");
				BufferedReader br = new BufferedReader(new InputStreamReader(is))
			) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					NewProductBean newProduct = new NewProductBean();
					newProduct.setName(token[0]);
					newProduct.setBrand(token[1]);
					newProduct.setPrice(Integer.parseInt(token[2].trim()));
					newProduct.setPurchasePrice(Integer.parseInt(token[3].trim()));
					newProduct.setDiscount(Double.parseDouble(token[4].trim()));
					Clob clob = GlobalService.fileToClob(realPath + "/" + token[5]);
					newProduct.setCopy(clob);
					clob = GlobalService.fileToClob(realPath + "/" + token[6]);
					newProduct.setDesc(clob);
					Blob blob = GlobalService.fileToBlob(realPath + "/" + token[7].trim());
					newProduct.setPicture(blob);
					newProduct.setFileName(GlobalService.extractFileName(token[7].trim()));
					newProduct.setMimeType(token[8]);
					newProduct.setStock(Integer.parseInt(token[9].trim()));
					// 讀取圖片檔
					blob = GlobalService.fileToBlob(realPath + "/" + token[10].trim());
					newProduct.setBgpicture(blob);
					newProduct.setBgfileName(GlobalService.extractFileName(token[10].trim()));
					blob = GlobalService.fileToBlob(realPath + "/" + token[11].trim());
					newProduct.setLevelpicture(blob);
					newProduct.setLevelfileName(GlobalService.extractFileName(token[11].trim()));
					blob = GlobalService.fileToBlob(realPath + "/" + token[12].trim());
					newProduct.setCnpicture(blob);
					newProduct.setCnfileName(GlobalService.extractFileName(token[12].trim()));
					session.save(newProduct);
					count++;
				}
				log.info("newProduct 資料新增成功，紀錄個數: " + count);
			} catch (IOException e) {
				log.info("新建newProduct資料時發生IO例外: " + e.getMessage());
				e.printStackTrace();
			}
			session.flush();
			count = 0;
			
			// 2. oldProduct表格
			// 2-1 由"/WEB-INF/rez_data/oldProduct.txt"逐筆讀入oldProduct表格內的初始資料，然後依序新增到oldProduct表格中
			try (
				InputStream is = servletContext.getResourceAsStream("/WEB-INF/rez_data/oldProduct.txt");
				BufferedReader br = new BufferedReader(new InputStreamReader(is))
			) {
				while ((line = br.readLine()) != null) {
					log.info("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					OldProductBean oldProduct = new OldProductBean();
					oldProduct.setName(token[0]);
					oldProduct.setBrand(token[1]);
					oldProduct.setAcqprice(Integer.parseInt(token[2].trim()));
					oldProduct.setPrice(Integer.parseInt(token[3].trim()));
					oldProduct.setLeasePrice(Integer.parseInt(token[4].trim()));
					oldProduct.setDiscount(Double.parseDouble(token[5].trim()));
					// 讀取文字檔
					Clob clob = GlobalService.fileToClob(realPath + "/" + token[6]);
					oldProduct.setCopy(clob);
					clob = GlobalService.fileToClob(realPath + "/" + token[7]);
					oldProduct.setDesc(clob);
					// 讀取圖片檔
					Blob blob = GlobalService.fileToBlob(realPath + "/" + token[8].trim());
					oldProduct.setPicture(blob);
					oldProduct.setFileName(GlobalService.extractFileName(token[8].trim()));
					oldProduct.setMimeType(token[9]);
					oldProduct.setStock(Integer.parseInt(token[10].trim()));
					blob = GlobalService.fileToBlob(realPath + "/" + token[11].trim());
					oldProduct.setBgpicture(blob);
					oldProduct.setBgfileName(GlobalService.extractFileName(token[11].trim()));
					blob = GlobalService.fileToBlob(realPath + "/" + token[13].trim());
					oldProduct.setLevelpicture(blob);
					oldProduct.setLevelfileName(GlobalService.extractFileName(token[13].trim()));
					blob = GlobalService.fileToBlob(realPath + "/" + token[14].trim());
					oldProduct.setCnpicture(blob);
					oldProduct.setCnfileName(GlobalService.extractFileName(token[14].trim()));
					session.save(oldProduct);
					count++;
				}
				// 印出資料新增成功的訊息
				log.info("oldProduct資料新增成功，紀錄個數: " + count);
			}
			session.flush();
			
			// 3. Member表格
			// 3-1由"rez_data/account.txt"逐筆讀入Member表格內的初始資料，
			// 然後依序新增到Member表格中
			count = 0;
			try (
				InputStream is = servletContext.getResourceAsStream("/WEB-INF/rez_data/account.txt");
				BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			) {
				while ((line = br.readLine()) != null) {
					String[] sa = line.split("\\|");
					MemberBean bean = new MemberBean();
					bean.setMemberId(sa[0]);
					String pswd = GlobalService.getMD5Endocing(GlobalService.encryptString(sa[1]));
					bean.setPassword(pswd);
					bean.setBirthday(Date.valueOf(sa[2]));
					bean.setName(sa[3]);
					bean.setNickName(sa[4]);
					bean.setPhone(sa[5]);
					bean.setEmail(sa[6]);
					bean.setAddress(sa[7]);
					// --------------處理Blob(圖片)欄位----------------
					Blob sb = GlobalService.fileToBlob(realPath + "/" + sa[8]);
					bean.setMemberImage(sb);
					bean.setFileName(GlobalService.extractFileName(sa[8].trim()));
					bean.setRank(sa[10]);
					bean.setRegisterTime(new Timestamp(System.currentTimeMillis()));
					bean.setReviseTime(Timestamp.valueOf(sa[11]));
					session.save(bean);
					count++;
				}
				log.info("新增Member紀錄，計" + count + "筆記錄");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} catch (SQLException e) {
			System.err.println("新增Member紀錄時發生SQL例外: " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("新增Member紀錄時發生IO例外: " + e.getMessage());
		}
	}

	@Override
	public void rebuildTableAndIndex() {
		Session session = factory.getCurrentSession();

		String realPath = servletContext.getRealPath("/");

		String fileOfSqlCommand = "";
		if (DBService.DB_TYPE.equals(DBService.DB_MYSQL)) {
			fileOfSqlCommand = "/WEB-INF/rez_data/ResetTableSchemaMySQL.txt";
		} else if (DBService.DB_TYPE.equals(DBService.DB_SQLSERVER)) {
			fileOfSqlCommand = "/WEB-INF/data/ResetTableSchemaSQLServer.txt";
		}
		try (FileInputStream fis = new FileInputStream(realPath + fileOfSqlCommand);
				BufferedReader br = new BufferedReader(new InputStreamReader(fis));) {
			String line = "";
			String sql = "";
			while ((line = br.readLine()) != null) {
				if (line.indexOf("Hibernate") >= 0 || line.trim().length() == 0) {
					if (sql.length() > 0) {
						log.info("sql=" + sql);
						try {
							NativeQuery<?> query = session.createNativeQuery(sql);
							query.executeUpdate();
						} catch (Exception e) {
							log.info("已攔截例外:" + e.getMessage());
							// e.printStackTrace();
						}
						sql = "";
					}
					continue;
				}
				sql += line.trim() + " ";
			}
			if (sql.length() > 0) {
				log.info("Last SQL=" + sql);
				try {
					NativeQuery<?> query = session.createNativeQuery(sql);
					query.executeUpdate();
				} catch (Exception e) {
					log.info("已攔截例外:" + e.getMessage());
				}
				sql = "";
			} else {
				log.info("Last SQL is Empty.");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
//		String sqlyPrefix = "ALTER TABLE Member AUTO_INCREMENT = 1";
//		
//		String sqlsPrefix = "DBCC CHECKIDENT ('dbo.Member', RESEED, 0);";
	}

}
