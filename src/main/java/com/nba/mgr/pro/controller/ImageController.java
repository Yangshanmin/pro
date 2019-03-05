package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.service.ImageService;
import com.nba.mgr.pro.util.ImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;

@Controller
@RequestMapping("image")
public class ImageController {

    @Autowired
    private ImageService imageService;

    // 上传图片到本地
    @RequestMapping(value = "/uploadImage")
    @ResponseBody
    public String upload(@RequestParam MultipartFile image) {
        return imageService.upload(image);
    }

    // 查看本地图片
    @GetMapping("/images")
    public void getImage(
            @RequestParam("imageName") String imageName,
            HttpServletResponse response) throws Exception {
        response.setContentType("image/jpg");
        StreamUtils.copy(new FileInputStream(ImageUtil.IMAGE_DIR + imageName), response.getOutputStream());
    }
}
