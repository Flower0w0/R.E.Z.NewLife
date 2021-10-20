package _04_shop.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

//import _01_register.model.MemberBean;
import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;
import _04_shop.service.GameService;

@Controller
@RequestMapping("_04_shop")
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP", "totalPages", 
	"oldpageNo", "oldproducts_DPP", "oldtotalPages", "Nintendoproducts_DPP", 
	"Sonyproducts_DPP", "NpageNo", "SpageNo",	"NtotalPages", "StotalPages", 
	"oldNpageNo", "oldSpageNo", "oldNintendoproducts_DPP", "oldSonyproducts_DPP", 
	"oldNtotalPages", "oldStotalPages", "Nintendoproduct", "Sonyproduct", "Love"})
public class ShopController {

	private static Logger log = LoggerFactory.getLogger(ShopController.class);

	GameService service;
	ServletContext context; // 為了抓圖片id加的

	@Autowired
	public ShopController(GameService service, ServletContext context) {
		this.service = service;
		this.context = context;
	}

//	@GetMapping("/shopContent")
//	public String ShopContent(Model model) {
//		return"_04_shop/shopContent";		
//	}

//	// 詳細商品使用
//	@RequestMapping("/products")
//	public String list(Model model) {
//		List<NewProductBean> list = service.getAllProducts();
//		model.addAttribute("products", list);
//		return "_04_shop/shop";
//	}
//
//	// 詳細商品使用
//		@RequestMapping("/Oldproducts")
//		public String Oldlist(Model model) {
//			List<OldProductBean> list = service.getOldAllProducts();
//			model.addAttribute("products", list);
//			return "_04_shop/shopOld";
//		}
	
	@RequestMapping("/NewproductSearch.do")
	public String getNewProductByName(@RequestParam(value = "Name", required = false) String Name, Model model) {
		Map<Integer, NewProductBean> map = service.findByNewProductName(Name);
		model.addAttribute("NewproductSearch", map);
		return "_04_shop/shopSearch";
	}
	
	@RequestMapping("/OldproductSearch.do")
	public String getOldProductByName(@RequestParam(value = "Name", required = false) String Name, Model model) {
		Map<Integer, OldProductBean> map = service.findByOldProductName(Name);
		model.addAttribute("OldproductSearch", map);
		return "_04_shop/shopOldSearch";
	}
	
	@RequestMapping("/Newproduct")
	public String getProductById(@RequestParam(value = "id", required = false) Integer id, Model model) {
		model.addAttribute("product", service.getProductById(id));
		Map<String, String> map = new LinkedHashMap<>();
		Map<String, String> map2 = new LinkedHashMap<>();
		int num = 0;
		String line = "";
		Reader r = null;
		String content = "";
		NewProductBean bean = service.getProductById(id);
		if (bean != null) {
			Clob clob = bean.getCopy();
			Clob clob2 = bean.getDesc();
			if (clob != null) {
				try {
					r = clob.getCharacterStream();
					BufferedReader br = new BufferedReader(r);
					while ((line = br.readLine()) != null) { 
						num += 1;
						System.out.print(line + "\n");
						content = line + "\n";
						map.put("copy" + (char)num, content);
					}
					model.addAttribute("copy", map);
					br.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			num = 0;
			line = "";
			content = "";
			if (clob2 != null) {
				try {
					r = clob2.getCharacterStream();
					BufferedReader br = new BufferedReader(r);
					while ((line = br.readLine()) != null) { 
						num += 1;
						System.out.print(line + "\n");
						content = line + "\n";
						map2.put("desc" + (char)num, content);
					}
					model.addAttribute("desc", map2);
					br.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "_04_shop/shopContent";
	}
	
	
	
	@RequestMapping("/Oldproduct")
	public String getOldProductById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", service.getOldProductById(id));
		Map<String, String> map = new LinkedHashMap<>();
		Map<String, String> map2 = new LinkedHashMap<>();
		int num = 0;
		String line = "";
		Reader r = null;
		String content = "";
		OldProductBean bean = service.getOldProductById(id);
		if (bean != null) {
			Clob clob = bean.getCopy();
			Clob clob2 = bean.getDesc();
			if (clob != null) {
				try {
					r = clob.getCharacterStream();
					BufferedReader br = new BufferedReader(r);
					while ((line = br.readLine()) != null) { 
						num += 1;
						System.out.print(line + "\n");
						content = line + "\n";
						map.put("copy" + (char)num, content);
					}
					model.addAttribute("copy", map);
					br.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			num = 0;
			line = "";
			content = "";
			if (clob2 != null) {
				try {
					r = clob2.getCharacterStream();
					BufferedReader br = new BufferedReader(r);
					while ((line = br.readLine()) != null) { 
						num += 1;
						System.out.print(line + "\n");
						content = line + "\n";
						map2.put("desc" + (char)num, content);
					}
					model.addAttribute("desc", map2);
					br.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "_04_shop/shopOldContent";
	}

	// 修改處
	@GetMapping("/NewProducts")
	public String getPageProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam (value = "pageNo", required = false) Integer pageNo,
			@RequestParam (value = "NpageNo", required = false) Integer NpageNo,
			@RequestParam (value = "SpageNo", required = false) Integer SpageNo
	) {
//		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
//		if (memberBean == null) {
//			return "redirect:/_02_login/memberLogin";
//		}
//		String memberId = memberBean.getMemberId();
		if (pageNo == null) {
			pageNo = 1;
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
//					if (c.getName().equals(memberId + "pageNo")) {
					if (c.getName().equals("pageNo")) {
						try {
							pageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		if (NpageNo == null) {
			NpageNo = 1;
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
//					if (c.getName().equals(memberId + "NpageNo")) {
					if (c.getName().equals("NpageNo")) {
						try {
							NpageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		if (SpageNo == null) {
			SpageNo = 1;
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
//					if (c.getName().equals(memberId + "SpageNo")) {
					if (c.getName().equals("SpageNo")) {
						try {
							SpageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		log.info("讀取商品資訊，pageNo=" + pageNo);
		model.addAttribute("baBean", service);
		Map<Integer, NewProductBean> gameMap = service.getPageGames(pageNo);
		Map<Integer, NewProductBean> gameNintendoMap = service.getNintendoPageGames(NpageNo);
		Map<Integer, NewProductBean> gameSonyMap = service.getSonyPageGames(SpageNo);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("NpageNo", String.valueOf(NpageNo));
		model.addAttribute("SpageNo", String.valueOf(SpageNo));
//		model.addAttribute("totalPages", service.getTotalPages());
//		model.addAttribute("NtotalPages", service.getNTotalPages());
//		model.addAttribute("StotalPages", service.getSTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("products_DPP", gameMap);
		model.addAttribute("Nintendoproducts_DPP", gameNintendoMap);
		model.addAttribute("Sonyproducts_DPP", gameSonyMap);
		// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為memberId + "pageNo"
		// -----------------------
//		Cookie pnCookie = new Cookie(memberId + "pageNo", String.valueOf(pageNo));
//		Cookie npnCookie = new Cookie(memberId + "NpageNo", String.valueOf(NpageNo));
//		Cookie spnCookie = new Cookie(memberId + "SpageNo", String.valueOf(SpageNo));
		Cookie pnCookie = new Cookie("pageNo", String.valueOf(pageNo));
		Cookie npnCookie = new Cookie("NpageNo", String.valueOf(NpageNo));
		Cookie spnCookie = new Cookie("SpageNo", String.valueOf(SpageNo));
		// 設定Cookie的存活期為1天
		pnCookie.setMaxAge(1 * 24 * 60 * 60);
		npnCookie.setMaxAge(1 * 24 * 60 * 60);
		spnCookie.setMaxAge(1 * 24 * 60 * 60);
		// 設定Cookie的路徑為 Context Path
		pnCookie.setPath(request.getContextPath());
		npnCookie.setPath(request.getContextPath());
		spnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
		response.addCookie(pnCookie);
		response.addCookie(npnCookie);
		response.addCookie(spnCookie);

		return "_04_shop/shop";
	}
	
	// 修改處
		@GetMapping("/OldProducts")
		public String getOldPageProduct(Model model, HttpServletRequest request, HttpServletResponse response,
				@RequestParam (value = "oldpageNo", required = false) Integer oldpageNo,
				@RequestParam (value = "oldNpageNo", required = false) Integer oldNpageNo,
				@RequestParam (value = "oldSpageNo", required = false) Integer oldSpageNo
		) {
//			MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
//			if (memberBean == null) {
//				return "redirect:/_02_login/memberLogin";
//			}
//			String memberId = memberBean.getMemberId();
			if (oldpageNo == null) {
				oldpageNo = 1;
				// 讀取瀏覽器送來的所有 Cookies
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					// 逐筆檢視Cookie內的資料
					for (Cookie c : cookies) {
//						if (c.getName().equals(memberId + "oldpageNo")) {
						if (c.getName().equals("oldpageNo")) {
							try {
								oldpageNo = Integer.parseInt(c.getValue().trim());
							} catch (NumberFormatException e) {
								;
							}
							break;
						}
					}
				}
			}
			if (oldNpageNo == null) {
				oldNpageNo = 1;
				// 讀取瀏覽器送來的所有 Cookies
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					// 逐筆檢視Cookie內的資料
					for (Cookie c : cookies) {
//						if (c.getName().equals(memberId + "oldNpageNo")) {
						if (c.getName().equals("oldNpageNo")) {
							try {
								oldNpageNo = Integer.parseInt(c.getValue().trim());
							} catch (NumberFormatException e) {
								;
							}
							break;
						}
					}
				}
			}
			if (oldSpageNo == null) {
				oldSpageNo = 1;
				// 讀取瀏覽器送來的所有 Cookies
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					// 逐筆檢視Cookie內的資料
					for (Cookie c : cookies) {
//						if (c.getName().equals(memberId + "oldSpageNo")) {
						if (c.getName().equals("oldSpageNo")) {
							try {
								oldSpageNo = Integer.parseInt(c.getValue().trim());
							} catch (NumberFormatException e) {
								;
							}
							break;
						}
					}
				}
			}
			log.info("讀取商品資訊，oldpageNo=" + oldpageNo);
			model.addAttribute("baBean", service);
			Map<Integer, OldProductBean> oldGameMap = service.getOldPageGames(oldpageNo);
			Map<Integer, OldProductBean> oldGameNintendoMap = service.getOldNintendoPageGames(oldNpageNo);
			Map<Integer, OldProductBean> oldGameSonyMap = service.getOldSonyPageGames(oldSpageNo);
			model.addAttribute("oldpageNo", String.valueOf(oldpageNo));
			model.addAttribute("oldNpageNo", String.valueOf(oldNpageNo));
			model.addAttribute("oldSpageNo", String.valueOf(oldSpageNo));
			model.addAttribute("oldtotalPages", service.getOldTotalPages());
			model.addAttribute("oldNtotalPages", service.getOldNTotalPages());
			model.addAttribute("oldStotalPages", service.getOldSTotalPages());
			// 將讀到的一頁資料放入request物件內，成為它的屬性物件
			model.addAttribute("oldproducts_DPP", oldGameMap);
			model.addAttribute("oldNintendoproducts_DPP", oldGameNintendoMap);
			model.addAttribute("oldSonyproducts_DPP", oldGameSonyMap);
			// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為memberId + "pageNo"
			// -----------------------
//			Cookie pnCookie = new Cookie(memberId + "oldpageNo", String.valueOf(oldpageNo));
//			Cookie npnCookie = new Cookie(memberId + "oldNpageNo", String.valueOf(oldNpageNo));
//			Cookie spnCookie = new Cookie(memberId + "oldSpageNo", String.valueOf(oldSpageNo));
			Cookie pnCookie = new Cookie("oldpageNo", String.valueOf(oldpageNo));
			Cookie npnCookie = new Cookie("oldNpageNo", String.valueOf(oldNpageNo));
			Cookie spnCookie = new Cookie("oldSpageNo", String.valueOf(oldSpageNo));
			// 設定Cookie的存活期為1天
			pnCookie.setMaxAge(1 * 24 * 60 * 60);
			npnCookie.setMaxAge(1 * 24 * 60 * 60);
			spnCookie.setMaxAge(1 * 24 * 60 * 60);
			// 設定Cookie的路徑為 Context Path
			pnCookie.setPath(request.getContextPath());
			npnCookie.setPath(request.getContextPath());
			spnCookie.setPath(request.getContextPath());
			// 將Cookie加入回應物件內
			response.addCookie(pnCookie);
			response.addCookie(npnCookie);
			response.addCookie(spnCookie);

			return "_04_shop/shopOld";
		}
	
	
	
	// 商品詳細頁面抓圖片
		@RequestMapping(value = "/getPicture/{id}", method = RequestMethod.GET)
//	    回應本體的型態
		public ResponseEntity<byte[]> getPicture(Model model, HttpServletResponse resp, @PathVariable Integer id) {
			String filePath = "/images/NoImage.png";

			byte[] media = null;
			HttpHeaders headers = new HttpHeaders();
			String filename = "";
			int len = 0;
			NewProductBean bean = service.getProductById(id);
			if (bean != null) {
				Blob blob = bean.getPicture(); // 圖片
				filename = bean.getFileName(); // 檔名
				if (blob != null) {
					try {
						len = (int) blob.length();
						media = blob.getBytes(1, len);
					} catch (Exception e) {
						throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
					}

				} else {
					media = toByteArray(filePath);
					filename = filePath;
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			String mimeType = context.getMimeType(filename); // image/jpeg
			MediaType mediaType = MediaType.valueOf(mimeType);
			System.out.println("mediaType =" + mediaType);
			headers.setContentType(mediaType);
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
			return responseEntity;
		}


	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	// 商品詳細頁面抓圖片
			@RequestMapping(value = "/getOldPicture/{id}", method = RequestMethod.GET)
//		    回應本體的型態
			public ResponseEntity<byte[]> getOldPicture(Model model, HttpServletResponse resp, @PathVariable Integer id) {
				String filePath = "/images/NoImage.png";

				byte[] media = null;
				HttpHeaders headers = new HttpHeaders();
				String filename = "";
				int len = 0;
				OldProductBean bean = service.getOldProductById(id);
				if (bean != null) {
					Blob blob = bean.getPicture(); // 圖片
					filename = bean.getFileName(); // 檔名
					if (blob != null) {
						try {
							len = (int) blob.length();
							media = blob.getBytes(1, len);
						} catch (Exception e) {
							throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
						}

					} else {
						media = toByteArray(filePath);
						filename = filePath;
					}
				} else {
					media = toByteArray(filePath);
					filename = filePath;
				}
				headers.setCacheControl(CacheControl.noCache().getHeaderValue());
				String mimeType = context.getMimeType(filename); // image/jpeg
				MediaType mediaType = MediaType.valueOf(mimeType);
				System.out.println("mediaType =" + mediaType);
				headers.setContentType(mediaType);
				ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
				return responseEntity;
			}

	// 商品詳細頁面抓背景圖
	@RequestMapping(value = "/getBgpicture/{id}", method = RequestMethod.GET)
//	    回應本體的型態
	public ResponseEntity<byte[]> getBgpicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "/images/NoImage.png";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		NewProductBean bean = service.getProductById(id);
		if (bean != null) {
			Blob blob = bean.getBgpicture(); // 圖片
			filename = bean.getFileName(); // 檔名
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename); // image/jpeg
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	// 商品詳細頁面抓背景圖
		@RequestMapping(value = "/getOldBgpicture/{id}", method = RequestMethod.GET)
//		    回應本體的型態
		public ResponseEntity<byte[]> getOldBgpicture(HttpServletResponse resp, @PathVariable Integer id) {
			String filePath = "/images/NoImage.png";

			byte[] media = null;
			HttpHeaders headers = new HttpHeaders();
			String filename = "";
			int len = 0;
			OldProductBean bean = service.getOldProductById(id);
			if (bean != null) {
				Blob blob = bean.getBgpicture(); // 圖片
				filename = bean.getFileName(); // 檔名
				if (blob != null) {
					try {
						len = (int) blob.length();
						media = blob.getBytes(1, len);
					} catch (SQLException e) {
						throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
					}
				} else {
					media = toByteArray(filePath);
					filename = filePath;
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			String mimeType = context.getMimeType(filename); // image/jpeg
			MediaType mediaType = MediaType.valueOf(mimeType);
			System.out.println("mediaType =" + mediaType);
			headers.setContentType(mediaType);
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
			return responseEntity;
		}



}
