package _00_init.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _00_init.service.BaseService;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;
import _04_shop.service.GameService;

@Controller
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP", "totalPages", "ShoppingCart", "oldpageNo", "oldproducts_DPP",
		"oldtotalPages", "Nintendoproducts_DPP", "Sonyproducts_DPP", "NpageNo", "SpageNo", "NtotalPages", "StotalPages",
		"oldNpageNo", "oldSpageNo", "oldNintendoproducts_DPP", "oldSonyproducts_DPP", "oldNtotalPages",
		"oldStotalPages", "Nintendoproduct", "Sonyproduct" })
public class BaseController {

	private static Logger log = LoggerFactory.getLogger(BaseController.class);

	BaseService baseService;

	MemberService memberService;

	GameService gameService;

	ServletContext servletContext;

	@Autowired
	public BaseController(BaseService baseService, GameService gameService, MemberService memberService,
			ServletContext servletContext) {
		this.baseService = baseService;
		this.gameService = gameService;
		this.memberService = memberService;
		this.servletContext = servletContext;
	}

	@GetMapping("/")
	public String index(Model model, HttpServletRequest request, HttpServletResponse response) {
		List<NewProductBean> list = gameService.getNintendoProduct();
		model.addAttribute("Nintendoproduct", list);
		List<NewProductBean> list2 = gameService.getSonyProduct();
		model.addAttribute("Sonyproduct", list2);
		Integer pageNo = 1;
		Integer NpageNo = 1;
		Integer SpageNo = 1;
		// ?????????????????????????????? Cookies
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			// ????????????Cookie????????????
			for (Cookie c : cookies) {
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
		// ?????????????????????????????? Cookies
		Cookie[] cookies1 = request.getCookies();
		if (cookies1 != null) {
			// ????????????Cookie????????????
			for (Cookie c : cookies1) {
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
		// ?????????????????????????????? Cookies
		Cookie[] cookies2 = request.getCookies();
		if (cookies2 != null) {
			// ????????????Cookie????????????
			for (Cookie c : cookies2) {
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
		Map<Integer, NewProductBean> gameMap = gameService.getPageGames(pageNo);
		Map<Integer, NewProductBean> gameNintendoMap = gameService.getNintendoPageGames(NpageNo);
		Map<Integer, NewProductBean> gameSonyMap = gameService.getSonyPageGames(SpageNo);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("NpageNo", String.valueOf(NpageNo));
		model.addAttribute("SpageNo", String.valueOf(SpageNo));
		model.addAttribute("totalPages", gameService.getTotalPages());
		model.addAttribute("NtotalPages", gameService.getNTotalPages());
		model.addAttribute("StotalPages", gameService.getSTotalPages());
		// ??????????????????????????????request????????????????????????????????????
		model.addAttribute("products_DPP", gameMap);
		model.addAttribute("Nintendoproducts_DPP", gameNintendoMap);
		model.addAttribute("Sonyproducts_DPP", gameSonyMap);
		
		return "index";
	}

	@GetMapping("/initData")
	public String initData(Model model, RedirectAttributes ra) {
		String responseMessage;
		try {
			baseService.initData();
			responseMessage = "??????????????????";
		} catch (Exception ex) {
			ex.printStackTrace();
			responseMessage = "??????????????????";
		}
		log.info(responseMessage);
		ra.addFlashAttribute("initDataResult", responseMessage);
		return "redirect:/";
//		===========================================
	}

	// ????????????getMemberImage()????????????????????????????????????????????? id ?????????????????????????????????????????? ??????????????????
	@GetMapping("/_00_init/getGameImage")
	public ResponseEntity<byte[]> getGameImage(@RequestParam("id") Integer id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			NewProductBean bean = gameService.findById(id);
			if (bean != null) {
				blob = bean.getPicture();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}
			// ??????????????????????????????????????????????????????(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}
			// ???????????????????????????????????????MIME??????
			mimeType = servletContext.getMimeType(fileName);
			if (mimeType == null) {
				if (fileName.endsWith("jfif")) {
					mimeType = "image/jfif";
				}
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// ???InputStream???????????????????????????OutputStream??????
			int len = 0;
			byte[] bytes = new byte[81920];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveGameImageServlet#doGet()??????Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	// ??????????????????????????????
	@GetMapping("/_00_init/getLevelImage")
	public ResponseEntity<byte[]> getLevelImage(@RequestParam("id") Integer id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			NewProductBean bean = gameService.findById(id);
			if (bean != null) {
				blob = bean.getLevelpicture();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}
			// ??????????????????????????????????????????????????????(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}
			// ???????????????????????????????????????MIME??????
			mimeType = servletContext.getMimeType(fileName);
			if (mimeType == null) {
				if (fileName.endsWith("jfif")) {
					mimeType = "image/jfif";
				}
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// ???InputStream???????????????????????????OutputStream??????
			int len = 0;
			byte[] bytes = new byte[81920];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(
					"_00_init.util.RetrieveLevelImageServlet#doGet()??????Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	// ??????????????????????????????????????????
	@GetMapping("/_00_init/getCnImage")
	public ResponseEntity<byte[]> getCnImage(@RequestParam("id") Integer id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			NewProductBean bean = gameService.findById(id);
			if (bean != null) {
				blob = bean.getCnpicture();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}
			// ??????????????????????????????????????????????????????(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}
			// ???????????????????????????????????????MIME??????
			mimeType = servletContext.getMimeType(fileName);
			if (mimeType == null) {
				if (fileName.endsWith("jfif")) {
					mimeType = "image/jfif";
				}
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// ???InputStream???????????????????????????OutputStream??????
			int len = 0;
			byte[] bytes = new byte[81920];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveCnImageServlet#doGet()??????Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	// ????????????getMemberImage()????????????????????????????????????????????? id ?????????????????????????????????????????? ??????????????????
	@GetMapping("/_00_init/getOldGameImage")
	public ResponseEntity<byte[]> getOldGameImage(@RequestParam("id") Integer id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			OldProductBean bean = gameService.findOldById(id);
			if (bean != null) {
				blob = bean.getPicture();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}
			// ??????????????????????????????????????????????????????(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}
			// ???????????????????????????????????????MIME??????
			mimeType = servletContext.getMimeType(fileName);
			if (mimeType == null) {
				if (fileName.endsWith("jfif")) {
					mimeType = "image/jfif";
				}
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// ???InputStream???????????????????????????OutputStream??????
			int len = 0;
			byte[] bytes = new byte[81920];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveGameImageServlet#doGet()??????Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	// ??????????????????????????????
	@GetMapping("/_00_init/getOldLevelImage")
	public ResponseEntity<byte[]> getOldLevelImage(@RequestParam("id") Integer id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			OldProductBean bean = gameService.findOldById(id);
			if (bean != null) {
				blob = bean.getLevelpicture();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}
			// ??????????????????????????????????????????????????????(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}
			// ???????????????????????????????????????MIME??????
			mimeType = servletContext.getMimeType(fileName);
			if (mimeType == null) {
				if (fileName.endsWith("jfif")) {
					mimeType = "image/jfif";
				}
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// ???InputStream???????????????????????????OutputStream??????
			int len = 0;
			byte[] bytes = new byte[81920];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(
					"_00_init.util.RetrieveLevelImageServlet#doGet()??????Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	// ??????????????????????????????????????????
	@GetMapping("/_00_init/getOldCnImage")
	public ResponseEntity<byte[]> getOldCnImage(@RequestParam("id") Integer id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			OldProductBean bean = gameService.findOldById(id);
			if (bean != null) {
				blob = bean.getCnpicture();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}
			// ??????????????????????????????????????????????????????(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}
			// ???????????????????????????????????????MIME??????
			mimeType = servletContext.getMimeType(fileName);
			if (mimeType == null) {
				if (fileName.endsWith("jfif")) {
					mimeType = "image/jfif";
				}
			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// ???InputStream???????????????????????????OutputStream??????
			int len = 0;
			byte[] bytes = new byte[81920];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveCnImageServlet#doGet()??????Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	// ????????????getGameImage()????????????????????????????????????????????? id ??????????????????????????????????????????
	@GetMapping("/_00_init/getMemberImage")
	public ResponseEntity<byte[]> getMemberImage(@RequestParam("id") String id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			MemberBean bean = memberService.findByMemberId(id);
			if (bean != null) {
				blob = bean.getMemberImage();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getFileName();
			}
			// ??????????????????????????????????????????????????????(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}
			// ???????????????????????????????????????MIME??????
			mimeType = servletContext.getMimeType(fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// ???InputStream???????????????????????????OutputStream??????
			int len = 0;
			byte[] bytes = new byte[8192];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("_00_init.util.RetrieveBookImageServlet#doGet()??????Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}
//		=========================================================

}
